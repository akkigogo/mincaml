(* let rec f x = let l = Array.make 2 3 in l.(x) <- 3 in f 1 *)

(* let rec f a b c d e f = a + b + c + d + e in pr (f 1 2 3 4 5 6) *)

(* let rec f x = x + 1 in pr (f) *)

(* let rec sum n = if n = 1 then 1 else n + sum (n - 1) in print_int (sum 10) *)

(* let rec f x = if x < 0.1 then 1 else 0 in print_int (f 0.1)  *)

let l = Array.make 2 0 in let rec f x = l.(x) <- 1 in f 0