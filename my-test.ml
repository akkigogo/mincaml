(* let rec check n = 
  if (n = 0) 
  then ()
  else (
    let x = ((float_of_int)n /. 1000.) in
    print_int (int_of_float (1000. *. (sin (x) *. sin (x) +. cos (x) *. cos (x)))); check (n - 1)
    )
in check 2000 *)
(* let rec tan x = sin (x) /. cos (x) in *)
(* let rec check n = 
  if (n = 0) 
  then ()
  else (
    let x = ((float_of_int)n /. 1000.) in
    print_int (int_of_float (1000. *. tan x)); check (n - 1)
    )
in check 2000 *)
(* let rec f y = y +. 0. in
let x = f 0. in *)

let x = read_float () in
print_int (int_of_float (1000. *. cos x))
(* print_int 3
(* let x = read_int () in
print_int x *)