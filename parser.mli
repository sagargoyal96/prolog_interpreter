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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Execute.program
val expr :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Execute.atom
