let _ =
          try
            let lexbuf = Lexing.from_channel stdin in
            while true do
              let result = Parser.main Lexer.rework lexbuf in
            print_newline(); print_newline(); flush stdout
            done
          with Lexer.Eof ->
            exit 0
