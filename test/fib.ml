(* let rec fib n =
  if n <= 1 then n else
  fib (n - 1) + fib (n - 2) in
print_int (fib 30) *)

(* OK! *)

let rec fib n = 
  if n <= 1.0 then n else
  fib (n -. 1.0) +. fib (n -. 2.0) in
print_float (fib 10.0) 