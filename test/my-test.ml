(* let rec f x = let l = Array.make 2 3 in l.(x) <- 3 in f 1 *)

(* let rec f x = x + 1 in pr (f) *)

(* let rec sum n = if n = 1 then 1 else n + sum (n - 1) in print_int (sum 10) *)

(* let rec f x = if x < 0.1 then 1 else 0 in print_int (f 0.1)  *)

(* let rec f a = let (x, y) = a in x + y in pr (f (1, 3)) *)
(* if (1, 2, 3) = (2, 3, 4) then print (1) else print (0) *)

(* tuple flatteninig test*)

(* print (1, (2, 3)) *)
(* (LET Ti1.7 (INT 1)(LET Ti2.9 (INT 2)(LET Ti3.10 (INT 3)(LET Tt4.8 (TUPLE Ti2.9Ti3.10)(LET Tt5.6 (TUPLE Ti1.7Tt4.8)(AppDir min_caml_print Tt5.6)))))) *)
(* 
let rec f a = let (x, y) = a in x + y in pr (f (1, 3))
f.5  args: a.6  fv:  body: (LETTUPLE TUPLE( x.11 y.12 ) a.6 (ADD x.11 y.12)
(LET Ti1.9 (INT 1)(LET Ti2.10 (INT 3)(LET Tt3.8 (TUPLE Ti1.9Ti2.10)(LET Ti4.7 (AppDir f.5 Tt3.8)(AppDir min_caml_pr Ti4.7)))) *)
(* 
let rec f x = x + 1 in
  let l = if (f 1) > 0 then (2, 3) else (1, 2) in
    let (x, y) = l in
      print_int (x + y) *)

(* let rec f x = x + 1 in
let l = if (f 2) > 1 then (0, 0) else (1, 1) in let (a, b) = l in print_int (a + b) *)

(* f (1, (2, 3)) *)

(* let rec f x = (x, x) in let (y, z) = f 1 in pr (y + z) *)

(* let rec f x = l.(0) <- 2; (x, x) in let (a, b) = f 1 in a + b *)
(* 
let a = x in let b = x *)

let rec f x = (x, x) in let (a, b) = f 1 in a + b



