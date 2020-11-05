let rec f _ = 123 in
let rec g _ = 456 in

let x = f () in
print_int ((if x <= 0 then g () + x else x) + x)
(* x��then��Ǥϥ����֤��졢else��Ǥϥ����֤���ʤ� *)
(* ����ˡ�x��then��Ǥ�r0�ˡ�else��Ǥ�r1�ˤ��� *)

(* labelが続いてしまうときを解決すれば OK *)