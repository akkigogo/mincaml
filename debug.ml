(*抽象構文をdebug.txtに出力する関数*)

open Syntax
open Id

let ok = Printf.printf("OK\n")

let rec out_parser_arg oc e =
  match e with
    |[] -> Printf.fprintf oc ("")
    |(i1, _)::rest -> Printf.fprintf oc ("%s ") i1; out_parser_arg oc rest

let rec out_parser_tuple oc t1 = match t1 with
  | [] -> Printf.fprintf oc ("");
  | e1::rest -> out_parser oc e1; out_parser_tuple oc rest;
  and
  out_parser oc exp = match exp with
  | Unit ->  Printf.fprintf oc ("(UNIT"); Printf.fprintf oc (")")
  | Bool x ->  Printf.fprintf oc ("(BOOL %B") x; Printf.fprintf oc (")")
  | Int x ->  Printf.fprintf oc ("(INT %d") x; Printf.fprintf oc (")")
  | Float x ->  Printf.fprintf oc ("(FLOAT %f") x; Printf.fprintf oc (")")
  | Not e1 ->  Printf.fprintf oc ("(NOT "); out_parser oc e1 ; Printf.fprintf oc (")")
  | Neg e1 ->  Printf.fprintf oc ("(NEG "); out_parser oc e1; Printf.fprintf oc (")")
  | Add (e1, e2) ->  Printf.fprintf oc ("(ADD "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | Sub (e1, e2) ->  Printf.fprintf oc ("(SUB "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | FNeg e1 ->  Printf.fprintf oc ("(FNEG "); out_parser oc e1; Printf.fprintf oc (")")
  | FAdd (e1, e2) ->  Printf.fprintf oc ("(FADD "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | FSub (e1, e2) ->  Printf.fprintf oc ("(FSUB "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | FMul (e1, e2) ->  Printf.fprintf oc ("(FMUL "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | FDiv (e1, e2) ->  Printf.fprintf oc ("(FDIV "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | Eq (e1, e2) ->  Printf.fprintf oc ("(EQ "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | LE (e1, e2) ->  Printf.fprintf oc ("(LE "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | If (e1, e2, e3) ->  Printf.fprintf oc ("(IF "); out_parser oc e1; out_parser oc e2; out_parser oc e3; Printf.fprintf oc (")")
  | Let ((i1, t1), e1, e2) ->  Printf.fprintf oc ("(LET "); Printf.fprintf oc ( "%s = ") i1; out_parser oc e1; Printf.fprintf oc (" IN "); out_parser oc e2; Printf.fprintf oc (")")
  | Var e1 ->  Printf.fprintf oc ("(VAR %s") e1; Printf.fprintf oc (")")
  | LetRec (f1, e1) ->  Printf.fprintf oc ("(LETREC "); out_parser_fundef oc f1; out_parser oc e1;  Printf.fprintf oc (")")
  | App (e1, l1) ->  Printf.fprintf oc ("(APP "); out_parser oc e1; out_parser_tuple oc l1; Printf.fprintf oc (")")
  | Tuple l1 ->  Printf.fprintf oc ("(TUPLE "); out_parser_tuple oc l1; Printf.fprintf oc (")")
  | LetTuple (l1 , e1 , e2) -> Printf.fprintf oc ("(LETTUPLE TUPLE( "); out_parser_arg oc l1; Printf.fprintf oc (") = "); out_parser oc e1; Printf.fprintf oc (" IN "); out_parser oc e2;
  | Array (e1, e2) ->  Printf.fprintf oc ("(ARRAY_MAKE "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | Get (e1, e2) ->  Printf.fprintf oc ("(GET "); out_parser oc e1; out_parser oc e2; Printf.fprintf oc (")")
  | Put (e1, e2, e3) ->  Printf.fprintf oc ("(PUT "); out_parser oc e1; out_parser oc e2; out_parser oc e3 ; Printf.fprintf oc (")")
  and out_parser_fundef oc f1 = 
  let (i1, t1) = f1.name in
  let k = f1.args in
  let e = f1.body in
  Printf.fprintf oc ("%s ") i1; out_parser_arg oc k; out_parser oc e

(* fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t } *)

type t =
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
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
(*Knormalをdebug.txtに出力する関数*)

let rec out_knormal = 
