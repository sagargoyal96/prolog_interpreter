 (* File lexer.mll *)
        {
        open Parser
        exception Eof
        exception Bad       (* The type rework is defined in parser.mli *)
        }
        rule rework = parse
           [' ' '\t']     { rework lexbuf }
          | ['\n' ]        { EOL}
          | (['A'-'Z']['0'-'9' 'a'-'z' 'A'-'Z' '_']*) as abc { VOP(abc) }
          | (['a'-'z']['0'-'9' 'a'-'z' 'A'-'Z' '_' ]*) as abc { PHRASE(abc) }
          | ':'            { COLON }
          | '-'            { HYPHEN }
          | '('            { LPAREN }
          | ')'            { RPAREN }
          | 'T'            { TRUE }
          | 'F'            { FALSE }
          | '.'            { FSTOP } 
          | ','            { COMMA  }
      
          | eof           { raise Eof }
        

