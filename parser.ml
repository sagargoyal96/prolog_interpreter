type token =
  | PHRASE of (string)
  | VOP of (string)
  | COMMA
  | FSTOP
  | TRUE
  | FALSE
  | LPAREN
  | RPAREN
  | HYPHEN
  | COLON
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"

open Execute ;;

# 21 "parser.ml"
let yytransl_const = [|
  259 (* COMMA *);
  260 (* FSTOP *);
  261 (* TRUE *);
  262 (* FALSE *);
  263 (* LPAREN *);
  264 (* RPAREN *);
  265 (* HYPHEN *);
  266 (* COLON *);
  267 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* PHRASE *);
  258 (* VOP *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\003\000\003\000\004\000\004\000\002\000\005\000\
\005\000\005\000\005\000\000\000\000\000"

let yylen = "\002\000\
\001\000\002\000\003\000\006\000\001\000\003\000\004\000\001\000\
\001\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\013\000\
\000\000\002\000\000\000\000\000\000\000\000\000\000\000\003\000\
\000\000\000\000\000\000\007\000\000\000\000\000\011\000\010\000\
\000\000\000\000\006\000\004\000"

let yydgoto = "\003\000\
\005\000\006\000\007\000\022\000\015\000"

let yysindex = "\001\000\
\005\255\005\255\000\000\004\255\005\255\253\254\000\000\000\000\
\003\255\000\000\255\254\007\255\009\255\010\255\006\255\000\000\
\005\255\003\255\003\255\000\000\014\255\015\255\000\000\000\000\
\005\255\011\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\018\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\255\013\255\000\000\000\000\
\000\000\000\000\000\000\000\000\020\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\254\255\020\000\000\000\246\255"

let yytablesize = 25
let yytable = "\008\000\
\011\000\001\000\002\000\013\000\014\000\004\000\012\000\023\000\
\024\000\016\000\009\000\018\000\019\000\020\000\021\000\017\000\
\025\000\012\000\026\000\008\000\009\000\028\000\027\000\005\000\
\010\000"

let yycheck = "\002\000\
\004\001\001\000\002\000\001\001\002\001\001\001\010\001\018\000\
\019\000\011\001\007\001\003\001\003\001\008\001\017\000\009\001\
\003\001\000\000\004\001\008\001\008\001\011\001\025\000\004\001\
\005\000"

let yynames_const = "\
  COMMA\000\
  FSTOP\000\
  TRUE\000\
  FALSE\000\
  LPAREN\000\
  RPAREN\000\
  HYPHEN\000\
  COLON\000\
  EOL\000\
  "

let yynames_block = "\
  PHRASE\000\
  VOP\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'gadha) in
    Obj.repr(
# 17 "parser.mly"
               ( _1 )
# 108 "parser.ml"
               : Execute.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Execute.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'gadha) in
    Obj.repr(
# 18 "parser.mly"
                 ( progList:=(_1 @ _2) ;_1 @ _2 )
# 116 "parser.ml"
               : Execute.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Execute.atom) in
    Obj.repr(
# 23 "parser.mly"
                                           ( ([(_1,[])]) ;)
# 123 "parser.ml"
               : 'gadha))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : Execute.atom) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'yoma) in
    Obj.repr(
# 24 "parser.mly"
                                           ( ([(_1,_4)]) ;)
# 131 "parser.ml"
               : 'gadha))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Execute.atom) in
    Obj.repr(
# 31 "parser.mly"
                      ( [_1] )
# 138 "parser.ml"
               : 'yoma))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Execute.atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Execute.atom) in
    Obj.repr(
# 32 "parser.mly"
                     ( [_1] @ [_3] )
# 146 "parser.ml"
               : 'yoma))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'inside) in
    Obj.repr(
# 37 "parser.mly"
                                ( if !qOn then query:=[Predicate(_1,_3)];Predicate(_1,_3) )
# 154 "parser.ml"
               : Execute.atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 42 "parser.mly"
                        ( [Cons(_1)] )
# 161 "parser.ml"
               : 'inside))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
                        ( [Var(_1)] )
# 168 "parser.ml"
               : 'inside))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'inside) in
    Obj.repr(
# 44 "parser.mly"
                        ( [Var(_1)] @ _3 )
# 176 "parser.ml"
               : 'inside))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'inside) in
    Obj.repr(
# 45 "parser.mly"
                        ( [Cons(_1)] @ _3 )
# 184 "parser.ml"
               : 'inside))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry expr *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Execute.program)
let expr (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : Execute.atom)
