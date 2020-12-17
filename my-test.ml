(* let l = create_array 3 0. in
let rec f x y = l.(x) <- y in
let rec g z = l.(z) in
f 1 2.;
f 2 3.;
f 0 1.;
print_int (int_of_float (g 0));
print_int (int_of_float (g 1));
print_int (int_of_float (g 2)) *)

(* let l = create_array 3 (1, 1.) in
let rec f x y = l.(x) <- (y, 1.) in
let rec g z = let (a, b) = l.(z) in a in
f 1 2;
print_int (g 1) *)
(* 
let l = create_array 3 1 in
let m = create_array 4 l in
let rec f x y = m.(x).(y) in
print_int (f 1 2) *)

(* let l = create_array 3 1 in
let rec f m x = m.(x) in
let rec g y = f l y in
print_int (g 1) *)

let l = (1, 2) in
let rec f x =
  let (a, b) = l in a + x in
print_int (f 4)