(* translation into PowerPC assembly with infinite number of virtual registers *)

open Asm

let data = ref [] (* 浮動小数点の定数テーブル (caml2html: virtual_data) *)

let global_data2 = ref []
let int_data2 = ref []

(* (Id.t * int * Type.t * int) list  配列名 + 要素数　+ 型(int or float) + 先頭アドレス  *)

exception My_Error1
exception My_Error2
exception My_Error3
exception My_Error4
exception My_Error5

let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
      match t with
      | Type.Unit -> acc
      | Type.Float -> addf acc x
      | _ -> addi acc x t)
    ini
    xts

let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))

let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
      let offset = align offset in
      (offset + 4, addf x offset acc))
    (fun (offset, acc) x t ->
      (offset + 4, addi x t offset acc))

let rec my_add_let let_lis ans = match let_lis with
  | [] -> ans
  | (a, typ, addr)::rest -> Let((a, typ), Li(addr), (my_add_let rest ans))

let rec tuple_add_lis addr xts e2 = match xts with
  | [] -> e2
  | (x, typ)::rest -> Let((x, typ), Global_Lw(addr + 4, C(0)), (tuple_add_lis (addr + 4) rest e2))

let rec g env = function (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
  | Closure.Unit -> Ans(Nop)
  | Closure.Int(i) -> Ans(Li(i))
  | Closure.Float(d) ->
      (* let l =
        try
          (* 既に定数テーブルにあったら再利用 *)
          let (l, _) = List.find (fun (_, d') -> d = d') !data in
          l
        with Not_found ->
          let l = Id.L(Id.genid "l") in
          data := (l, d) :: !data;
          l in
      Ans(FLi(l)) *)
      Ans(FLi(d))
  | Closure.Neg(x) -> Ans(Neg(x))
  | Closure.Add(x, y) -> Ans(Add(x, V(y)))
  | Closure.Sub(x, y) -> Ans(Sub(x, V(y)))
  | Closure.Mult(x, y) -> Ans(Slw(x, C(2)))
  | Closure.Div(x, y) -> Ans(Slr(x, C(1)))
  | Closure.FNeg(x) -> Ans(FNeg(x))
  | Closure.FAdd(x, y) -> Ans(FAdd(x, y))
  | Closure.FSub(x, y) -> Ans(FSub(x, y))
  | Closure.FMul(x, y) -> Ans(FMul(x, y))
  | Closure.FDiv(x, y) -> Ans(FDiv(x, y))
  | Closure.IfEq(x, y, e1, e2) ->
      (match M.find x env with
      | Type.Bool | Type.Int -> Ans(IfEq(x, V(y), g env e1, g env e2))
      | Type.Float -> Ans(IfFEq(x, y, g env e1, g env e2))
      | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLT(x, y, e1, e2) ->
      (match M.find x env with
      | Type.Bool | Type.Int -> Ans(IfLT(x, V(y), g env e1, g env e2))
      | Type.Float -> Ans(IfFLT(x, y, g env e1, g env e2))      (* x <= y then e1 else e2 ---> if x > y then e2 else e1 ---> if y < x then e2 else e1  *)
      | _ -> failwith "inequality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
      let e1' = g env e1 in
      let e2' = g (M.add x t1 env) e2 in
      concat e1' (x, t1) e2'
  | Closure.Var(x) ->
      (match (try M.find x env with _ -> raise My_Error5) with
      | Type.Unit -> Ans(Nop)
      | Type.Float -> Ans(FMr(x))
      | _ -> Ans(Mr(x)))
  | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_fv = ys }, e2) -> (*Ans(Nop)*)(* クロージャの生成 (caml2html: virtual_makecls) *)
      (* Closureのアドレスをセットしてから、自由変数の値をストア *)
      let e2' = g (M.add x t env) e2 in
      let offset, store_fv =
        expand
          (List.map (fun y -> (y, (try M.find y env with _ -> raise My_Error4))) ys)
          (4, e2')
          (fun y offset store_fv -> seq(Stfd(y, x, C(offset)), store_fv))
          (fun y _ offset store_fv -> seq(Stw(y, x, C(offset)), store_fv)) in
      Let((x, t), Mr(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              let z = Id.genid "l" in
              Let((z, Type.Int), SetL(l),
                  seq(Stw(z, x, C(0)),
                      store_fv))))
  | Closure.AppCls(x, ys) -> (*Ans(Nop)*)
      let (int, float) = separate (List.map (fun y -> (y, (try M.find y env with _ -> (let (len, _, typ, addr) = List.assoc y !global_data2 in typ)))) ys) in
      Ans(CallCls(x, int, float))
  | Closure.AppDir(Id.L(x), ys) ->
  (
      let temp = ref [] in
      let (int, float) = separate (List.map (fun y -> (y, (try M.find y env with _ -> (let (len, _, typ, addr) = List.assoc y !global_data2 in temp := (y, typ, addr)::!temp; Array(typ))))) ys) in
      my_add_let !temp (Ans(CallDir(Id.L(x), int, float)))
  )
  | Closure.Tuple(xs) -> (* 組の生成 (caml2html: virtual_tuple) *)
      let y = Id.genid "t" in
      let (offset, store) =
        expand
          (List.map (fun x -> (x, M.find x env)) xs)
          (0, Ans(Mr(y)))
          (fun x offset store -> seq(Stfd(x, y, C(offset)), store))
          (fun x _ offset store -> seq(Stw(x, y, C(offset)), store))  in
      Let((y, Type.Tuple(List.map (fun x -> M.find x env) xs)), Mr(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              store))
  | Closure.LetTuple(xts, y, e2) ->
  (
    try let addr = List.assoc y !int_data2 in
        tuple_add_lis addr xts (g (M.add_list xts env) e2)
    with _ -> 
      let s = Closure.fv e2 in
      let (offset, load) =
        expand
          xts
          (0, g (M.add_list xts env) e2)
          (fun x offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            fletd(x, Lfd(y, C(offset)), load))
          (fun x t offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            Let((x, t), Lwz(y, C(offset)), load)) in
      load
  )
  | Closure.Get(x, y) -> (* ������ɤ߽Ф� (caml2html: virtual_get) *)
      let offset = Id.genid "o" in
      (try (
      (match M.find x env with
      | Type.Array(Type.Unit) -> Ans(Nop)
      | Type.Array(Type.Float) ->
          Let((offset, Type.Int), Slw(y, C(2)),
              Ans(Lfd(x, V(offset))))
      | Type.Array(_) ->
          Let((offset, Type.Int), Slw(y, C(2)),
              Ans(Lwz(x, V(offset))))
      | _ -> assert false)
      ) with _ -> 
      (
      let (len, _, typ, addr) = List.assoc x !global_data2 in
      if typ = Type.Float 
        then Let((offset, Type.Int), Slw(y, C(2)), Ans(Global_Lwf(addr, V(offset))))
      else Let((offset, Type.Int), Slw(y, C(2)), Ans(Global_Lw(addr, V(offset))))
    )
    )
  | Closure.Put(x, y, z) -> (
      let offset = Id.genid "o" in
      (try (
      (match M.find x env with
      | Type.Array(Type.Unit) -> Ans(Nop)
      | Type.Array(Type.Float) ->
          Let((offset, Type.Int), Slw(y, C(2)),
              Ans(Stfd(z, x, V(offset))))
      | Type.Array(_) ->
          Let((offset, Type.Int), Slw(y, C(2)),
              Ans(Stw(z, x, V(offset))))
      | _ -> assert false)
      ) with _ -> 
      (
        let (len, _, typ, addr) = List.assoc x !global_data2 in
        if typ = Type.Float
          then Let((offset, Type.Int), Slw(y, C(2)), Ans(Global_Swf(z, addr, V(offset))))
        else Let((offset, Type.Int), Slw(y, C(2)), Ans(Global_Sw(z, addr, V(offset))))
      )
      )
  )
  | Closure.ExtArray(Id.L(x)) -> Ans(SetL(Id.L("min_caml_" ^ x)))

(* 関数の仮想マシンコード生成 (caml2html: virtual_h) *)
let h { Closure.name = (Id.L(x), t); Closure.args = yts; Closure.formal_fv = zts; Closure.body = e } =
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (4,  g (M.add x t (M.add_list yts (M.add_list zts M.empty))) e)
      (fun z offset load -> fletd(z, Lfd(x, C(offset)), load))
      (fun z t offset load -> Let((z, t), Lwz(x, C(offset)), load)) in
  match t with
  | Type.Fun(_, t2) ->
      { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
  | _ -> assert false

(*　プログラム全体の仮想マシンコード生成 (caml2html: virtual_f) *)
let f (Closure.Prog(fundefs, e, global_data, int_data, float_data)) =
  data := [];
  global_data2 := global_data;
  int_data2 := int_data;
  (let fundefs = (List.map h fundefs) in
  let e =  (g M.empty e) in
  Prog(!data, fundefs, e, global_data, int_data, float_data)) 
