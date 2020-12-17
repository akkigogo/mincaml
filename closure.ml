type closure = { entry : Id.l; actual_fv : Id.t list }
type i_or_f = MyInt of int | MyFloat of float
type t = (* クロージャ変換後の式 (caml2html: closure_t) *)
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mult of Id.t * Id.t
  | Div of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLT of Id.t * Id.t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | MakeCls of (Id.t * Type.t) * closure * t
  | AppCls of Id.t * Id.t list
  | AppDir of Id.l * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtArray of Id.l
type fundef = { name : Id.l * Type.t;
                args : (Id.t * Type.t) list;
                formal_fv : (Id.t * Type.t) list;
                body : t }
type prog = Prog of fundef list * t * (Id.t * (int * Id.t * Type.t * int)) list * (Id.t * int) list * (Id.t * float) list

let rec fv = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
  | Neg(x) | FNeg(x) -> S.singleton x
  | Add(x, y) | Sub(x, y) | Mult(x, y) | Div(x, y) | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
  | IfEq(x, y, e1, e2)| IfLT(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, t), e1, e2) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x) -> S.singleton x
  | MakeCls((x, t), { entry = l; actual_fv = ys }, e) -> S.remove x (S.union (S.of_list ys) (fv e))
  | AppCls(x, ys) -> S.of_list (x :: ys)
  | AppDir(_, xs) | Tuple(xs) -> S.of_list xs
  | LetTuple(xts, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xts)))
  | Put(x, y, z) -> S.of_list [x; y; z]

let toplevel : fundef list ref = ref []
(* let newtoplevel : fundef list ref = ref [] *)

exception My_Error1
(* 
let rec find_fun label l = match l with
  | [] ->  raise Not_Found
  | fundef1 :: rest -> let (label1, _) = fundef1.name in 
    if (label1 = label) 
    then fundef1
    else let L(funname) = label1 in let L(labelname) = label in Printf.fprintf stdout "%s %s\n" funname labelname; find_fun label rest

let rec arg_name arglist = match arglist with
  | [] -> []
  | (a, b) :: rest -> a::(arg_name rest) *)
let dp = ref 20000
let int_data = ref []
let float_data = ref []
let global_data = ref []
let type_data = ref []
(* type t = 
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref *)
let rec tuple_alloc l1 = match l1 with
  | [] -> ()
  | i1::rest -> 
    (
      try (
        let x = List.assoc i1 !int_data in
        dp := !dp + 4;
        global_data := (i1, (1, i1, Type.Int, !dp))::(!global_data);
        tuple_alloc rest
      )
      with _ -> (
        let x = List.assoc i1 !float_data in
        dp := !dp + 4;
        global_data := (i1, (1, i1, Type.Float, !dp))::(!global_data); 
        tuple_alloc rest
      )
    )
  
let alloc i1 e = match e with
    | KNormal.Int (n1) -> int_data := (i1, n1)::(!int_data); type_data := (i1, Type.Int)::(!type_data)
    | KNormal.Float (n1) -> float_data := (i1, n1)::(!float_data); type_data := (i1, Type.Float)::(!type_data)
    | KNormal.Tuple (l1) -> int_data := (i1, !dp)::(!int_data); tuple_alloc l1
    | KNormal.ExtFunApp (j1, l1) -> 
      (
      let x::[y] = l1 in
      if (j1 = "create_array")
        then (global_data := (i1, ((List.assoc x !int_data), y, (List.assoc x !type_data), !dp))::(!global_data); int_data := (i1, !dp)::(!int_data); dp := 4 * (List.assoc x !int_data) + !dp; type_data := (i1, Type.Array(Type.Int))::(!type_data))
        else 
          if (j1 = "create_float_array")
            then (global_data := (i1, ((List.assoc x !int_data), y, Type.Float, !dp))::(!global_data); int_data := (i1, !dp)::(!int_data); dp := 4 * (List.assoc x !int_data) + !dp; type_data := (i1, Type.Array(Type.Float))::(!type_data))
            else assert false
      )
    | KNormal.Get(x, y) -> let a = (let (_, b, _, _) = List.assoc x !global_data in List.assoc b !int_data) in int_data := (i1, a)::(!int_data); type_data := (i1, Type.Int)::(!type_data)
    | _ -> ()

let fv2 e = S.diff (S.diff (fv e) (S.of_list (List.map (fun x -> let (a, _) = x in a) !global_data))) (S.of_list (List.map (fun x -> let (a, _) = x in a) !int_data))
  
let rec globalize e = match e with
  | KNormal.IfEq (i1, i2, e1, e2) -> globalize e1; globalize e2   (* 多分if文はレイトレ では関係ない *)
  | KNormal.IfLE (i1, i2, e1, e2) -> globalize e1; globalize e2
  | KNormal.Let ((i1, t1), e1, e2) -> alloc i1 e1; globalize e2
  | KNormal.LetTuple (l1, i1, e1) -> globalize e1
  | _ -> ()         (* 関数定義があった瞬間にglobal化を終了 *)

(* 「自由変数がないとわかっていて、普通に呼び出せる」関数の集合known *)
let rec g env known = function (* クロージャ変換ルーチン本体 (caml2html: closure_g) *)
  | KNormal.Unit -> Unit
  | KNormal.Int(i) -> Int(i)
  | KNormal.Float(d) -> Float(d)
  | KNormal.Neg(x) -> Neg(x)
  | KNormal.Add(x, y) -> Add(x, y)
  | KNormal.Sub(x, y) -> Sub(x, y)
  | KNormal.Mult(x, y) -> Mult(x, y)
  | KNormal.Div(x, y) -> Div(x, y)
  | KNormal.FNeg(x) -> FNeg(x)
  | KNormal.FAdd(x, y) -> FAdd(x, y)
  | KNormal.FSub(x, y) -> FSub(x, y)
  | KNormal.FMul(x, y) -> FMul(x, y)
  | KNormal.FDiv(x, y) -> FDiv(x, y)
  | KNormal.IfEq(x, y, e1, e2) -> IfEq(x, y, g env known e1, g env known e2)
  | KNormal.IfLE(x, y, e1, e2) -> IfLT(y, x, g env known e2, g env known e1)
  | KNormal.Let((x, t), e1, e2) -> Let((x, t), g env known e1, g (M.add x t env) known e2)
  | KNormal.Var(x) -> Var(x)
  | KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2) -> (* 関数定義の場合 (caml2html: closure_letrec) *)
      (*　関数定義let rec x y1 ... yn = e1 in e2の場合は,
         xに自由変数がない(closureを介さず、directに呼び出せる)
         と仮定し、knownに追加してe1をクロージャ変換してみる *)
      let toplevel_backup = !toplevel in
      let env' = M.add x t env in
      let known' = S.add x known in
      let e1' = g (M.add_list yts env') known' e1 in (* なぜe1をgに一回通すのか?? A.e1内にxがさらに出てくるとき *)
      (* 本当に自由変数がなかったか、変換結果e1'を確認する *)
      (* 注意: e1'にx自身が変数として出現する場合はclosureが必要!
         (thanks to nuevo-namasute and azounoman; test/cls-bug2.ml����) *)
      let zs = S.diff (fv2 e1') (S.of_list (List.map fst yts)) in
      let known', e1' =
        if S.is_empty zs then known', e1' else
        (* 駄目だったら状態(toplevelの値)を戻して、クロージャ変換をやり直す  *)
        (Format.eprintf "free variable(s) %s found in function %s@." (Id.pp_list (S.elements zs)) x;
         Format.eprintf "function %s cannot be directly applied in fact@." x;
         toplevel := toplevel_backup;
         let e1' = g (M.add_list yts env') known e1 in
         known, e1') in
      let zs = S.elements (S.diff (fv2 e1') (S.add x (S.of_list (List.map fst yts)))) in (* 自由変数のリスト *)
      let zts = List.map (fun z -> (z, M.find z env')) zs in (* ここで自由変数zの型を引くために引数envが必要 *)
      toplevel := { name = (Id.L(x), t); args = yts; formal_fv = zts; body = e1' } :: !toplevel; (* トップレベル関数を追加 *)
      (* newtoplevel := { name = (Id.L(x), t); args = yts@zts; formal_fv = []; body = e1' } :: !newtoplevel; *)
      let e2' = g env' known' e2 in
      if S.mem x (fv2 e2') then (* xが変数としてe2'に出現する *)
        MakeCls((x, t), { entry = Id.L(x); actual_fv = zs }, e2') (* 出現していたら削除しない *)
      else
        (Format.eprintf "elimina＾ing closure(s) %s@." x;
         e2') (* 出現しなければMakeClsを削除 *)
  | KNormal.App(x, ys) when S.mem x known -> (* 関数適用の場合 (caml2html: closure_app) *)
      Format.eprintf "directly applying %s@." x;
      AppDir(Id.L(x), ys)
  | KNormal.App(f, xs) ->
     (* (try
      let thisfun = find_fun (L(f)) !toplevel in
      let inserted_fv = arg_name thisfun.formal_fv in
      AppDir(Id.L(f), xs@(inserted_fv)) 
    with _ -> *) AppCls(f, xs)
  | KNormal.Tuple(xs) -> Tuple(xs)
  | KNormal.LetTuple(xts, y, e) -> LetTuple(xts, y, g (M.add_list xts env) known e)
  | KNormal.Get(x, y) -> Get(x, y)
  | KNormal.Put(x, y, z) -> Put(x, y, z)
  | KNormal.ExtArray(x) -> ExtArray(Id.L(x))
  | KNormal.ExtFunApp(x, ys) -> AppDir(Id.L("min_caml_" ^ x), ys)

let rec de1 l = match l with
  | [] -> ()
  | (x, _) :: rest -> print_string x; de1 rest

let f e =
  toplevel := [];
  globalize e;
  print_string "start\n";
  de1 !global_data;
  let e' = g M.empty S.empty e in
  Prog(List.rev !toplevel, e', !global_data, !int_data, !float_data)
