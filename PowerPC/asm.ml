(* PowerPC assembly with a few virtual instructions *)

type id_or_imm = V of Id.t | C of int
type t = (* 命令の列 (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* 一つ一つの命令に対応する式 (caml2html: sparcasm_exp) *)
  | Nop
  | Li of int
  | FLi of (* Id.t *) float
  | SetL of Id.l
  | Mr of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Slw of Id.t * id_or_imm
  | Slr of Id.t * id_or_imm
  | Lwz of Id.t * id_or_imm
  | Stw of Id.t * Id.t * id_or_imm
  | FMr of Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | Lfd of Id.t * id_or_imm
  | Stfd of Id.t * Id.t * id_or_imm
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLT of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLT of Id.t * Id.t * t * t
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 (caml2html: sparcasm_save) *)
  | Restore of Id.t (* スタック変数から値を復元 (caml2html: sparcasm_restore) *)
  | Global_Lw of int * id_or_imm
  | Global_Lwf of int * id_or_imm
  | Global_Sw of Id.t * int * id_or_imm
  | Global_Swf of Id.t * int * id_or_imm
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* プログラム全体 = 浮動小数点数テーブル + トップレベル関数 + メインの式　(caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t * (Id.t * (int * Id.t * Type.t * int)) list * (Id.t * int) list * (Id.t * float) list

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)


(*　ppc での　話ですね〜
　揮発性レジスタとは、関数呼び出しの前後で内容が変わっていても良いレジスタの事であり、%r0, %r3~%r10がこれに該当する。
 非揮発性レジスタとは、関数呼び出しの前後で内容が変わっていてはいけないレジスタのことであり、%r1, %r2, %r11~%r31がこれに該当する。
 非揮発性レジスタは大きい方から順番に(%r31から順番に)用いる。*)
let regs = (* Array.init 27 (fun i -> Printf.sprintf "_R_%d" i) *)
  [| "%$a0"; "%$a1"; "%$a2"; "%$a3"; "%$t0"; "%$t1"; "%$t2";
     "%$t3"; "%$t4"; "%$t5"; "%$t6"; "%$t7"; "%$t8"; "%$t9"; "%$k0";
     "%$k1"; "%$v0"; "%$v1"; "%$at"; "%$s2"; "%$s3";
     "%$s4"; "$s5"; "%$s6"; "$s7" |]
let fregs = Array.init 31 (fun i -> Printf.sprintf "%%$f%d" i)  (* 浮動小数点レジスタ *)
let allregs = Array.to_list regs
let allfregs = Array.to_list fregs
let reg_cl = regs.(Array.length regs - 1) (* closure address (caml2html: sparcasm_regcl) *)
let reg_sw = regs.(Array.length regs - 2) (* temporary for swap *)
let reg_fsw = fregs.(Array.length fregs - 1) (* temporary for swap *)
let reg_sp = "%$sp" (* stack pointer *)
let reg_hp = "%$gp" (* heap pointer (caml2html: sparcasm_reghp) *)  
let reg_tmp = "%r31" (* [XX] ad hoc *)
let reg_my_temp = "%$s1"
let reg_zero = "%$zero"
let reg_ra = "%$ra"
let is_reg x = (x.[0] = '%')

(* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | Li(_) | FLi(_) | SetL(_) | Comment(_) | Restore(_) -> []
  | Mr(x) | Neg(x) | FMr(x) | FNeg(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub(x, y') | Slw(x, y') | Slr(x, y') | Lfd(x, y') | Lwz(x, y') -> x :: fv_id_or_imm y'
  | Stw(x, y, z') | Stfd(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLT(x, y', e1, e2) ->  x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLT(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
  | Global_Lw (_, x) | Global_Lwf (_, x) -> fv_id_or_imm x
  | Global_Sw (x, _, y) | Global_Swf (x, _, y) -> x :: fv_id_or_imm y
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

(* let align i = (if i mod 8 = 0 then i else i + 4) *)
let align i = i