let rec f _ = 123 in
let rec g _ = 456 in

let x = f () in
print_int ((if x <= 0 then g () + x else x) + x)

(* labelが続いてしまうときを解決すれば OK *)