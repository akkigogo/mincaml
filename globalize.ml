type t = (* K正規化後の式 (caml2html: knormal_t) *)
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
  | IfEq of Id.t * Id.t * t * t (* 比較 + 分岐 (caml2html: knormal_branch) *)
  | IfLE of Id.t * Id.t * t * t (* 比較 + 分岐 *)
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of Id.t * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtArray of Id.t
  | ExtFunApp of Id.t * Id.t list
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

let dp = ref 40000
let global_data = ref []

let alloc e = match i1 e with
  | Tuple (l1) -> global_data := (i1, !dp)::(!global_data); dp := 4 * (List.length l1) + !dp
  | ExtFunApp -> 
    let x::_ = l1 in
    if (i1 = "create_array") || (i1 == "create_float_array")
      then global_data := (i1, !dp)::(!global_data); dp := 4 * x + !dp
      else ()
  | _ -> ()

let rec globalize e = match e with
| IfEq (i1, i2, e1, e2) -> globalize e1; globalize e2   (* 多分if文はレイトレ では関係ない *)
| IfLE (i1, i2, e1, e2) -> globalize e1; globalize e2
| Let ((i1, t1), e1, e2) -> alloc e1; globalize e2
| LetTuple (l1, i1, e1) -> globalize e1
| _ -> ()         (* 関数定義があった瞬間にglobal化を終了 *)
  
  


(* is_global はまだグローバル領域にいるかどうかを表すbool値 *)
(* let rec f e is_global = match e with 
  | IfEq (i1, i2, e1, e2) -> IfEq (i1, i2, f e1 is_global, f e2 is_global)
  | IfLE (i1, i2, e1, e2) -> IfLE (i1, i2, f e1 is_global, f e2 is_global)
  | Let ((i1, t1), e1, e2) -> Let ((i1, t1), f e1 is_global, f e2 is_global)    (* もしかしたら、e1で関数定義があってe2がグローバルじゃないかも *)
  | LetRec (f1, e1) -> LetRec (f1, f e1 false)
  | Tuple (l1) -> if is_global then GlobalTuple (l1) else Tuple (l1)
  | Lettuple (l1, i1, e1) -> Lettuple (l1, i1, f e1 is_global)
  | ExtFunApp (i1, l1) -> (
    if is_global then (
      let x::[y] = l1 in
      if i1 = "create_array"
        then GlobalArray (x, y)
      else if i1 = "create_float_array"
        then GlobalFloatArray (x, y)
    )
    else e
  )
  | _ -> e *)
      
      