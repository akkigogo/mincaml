(* let rec f x = let l = Array.make 2 3 in l.(x) <- 3 in f 1 *)

(* let rec f a b c d e f = a + b + c + d + e in pr (f 1 2 3 4 5 6) *)

(* let x = 1 in f y = x + y in f 3 *)

let rec i x = x in
    let z = 4 in
    let rec f = i (z - 5) in
        if z < 6 then print_my_tuple (i, f 7) else print_my_tuple (f, 8)