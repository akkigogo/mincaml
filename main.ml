let limit = ref 1000

let rec iter n e = (* ��Ŭ�������򤯤꤫���� (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf outchan l = (* �Хåե��򥳥�ѥ��뤷�ƥ����ͥ�ؽ��Ϥ��� (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  let debug_outchan = open_out ("debug.txt") in  (* debug.txtにデバッグ用コードを出力 *)
   let s1 = Parser.exp Lexer.token l in
   Printf.fprintf debug_outchan "Syntax\n"; (* Syntax.tを出力 *)
   Debug.out_parser debug_outchan s1;
   Printf.fprintf debug_outchan "\nKNormal\n"; (* KNormal.tを出力 *)
   let s2 = KNormal.f (Typing.f s1) in
   Debug.out_knormal debug_outchan s2;
   Printf.fprintf debug_outchan "\nAlpha\n"; (* alpha変換後のNormal.tを出力 *) 
   let s3 = Alpha.f s2 in
   Debug.out_knormal debug_outchan s3;
   Printf.fprintf debug_outchan "\nafter Commondelete\n"; (* 共通部分式削除 を出力*)
   let s4 = Commondelete.f s3 in
   Debug.out_knormal debug_outchan s4;
   Printf.fprintf debug_outchan "\nafter closure\n"; (* クロージャー変換後 *)
   let s5 = Closure.f (iter !limit s4) in
   Debug.out_closure debug_outchan s5;
   let s6 = Tuple_flattening.f s5 in
   Printf.fprintf debug_outchan "\nafter tuple_flattening\n"; 
   Debug.out_closure debug_outchan s6;
  Emit.f outchan
    (RegAlloc.f
       (Simm.f
          (Virtual.f
            s5)))

let string s = lexbuf stdout (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  try
    lexbuf outchan (Lexing.from_channel inchan);
    close_in inchan;
    close_out outchan;
  with e -> (close_in inchan; close_out outchan; raise e)

let () = (* �������饳��ѥ���μ¹Ԥ����Ϥ���� (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
