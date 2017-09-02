open Execute;;
open Printf;;

(* let rec printpr pr = match pr with
[] -> ()
| hd :: tl -> ( match hd with
Fact(sd) -> print_string("fact") ;flush stdout
| Rule(hdd,tld) -> print_string("Rule") ;flush stdout) 
;;
 *)
  (*       let main() =
          try
            let lexbuf = Lexing.from_channel stdin in
            while true do
              let result = Parser.main Start.count lexbuf in
                print_string("dd"); flush stdout
            done
          with Start.Eof ->
            exit 0
let _ = Printexc.print main ();;  *)



let workonfile inp = try  
            let progfile = String.sub inp 1 ((String.length inp) - 3) in
                  let fopen = open_in progfile in
                  let lexbuf = Lexing.from_channel fopen in
                  while true do
                      let result = Parser.main Lexer.rework lexbuf in
                      ()
                    (* if result = 1 then  print_string("dfdf"); flush stdout *)
                  done
                with Lexer.Eof -> print_string("true.") ; print_newline()
;;


let workonquery inp =  
        try 
          qOn := true ;
          query := ([]:atom list) ;
          let lexbuf = Lexing.from_string inp in
                while true do
                    let result = Parser.main Lexer.rework lexbuf in
                    ()
                  (* if result = 1 then  print_string("dfdf"); flush stdout *)
                done
              with Lexer.Eof -> match !query with hd:: tl -> 
                  try let df = crux !progList [hd] hd [] in (print_string("true");print_newline()) with Pcrux-> print_string("false.") ; print_newline()
            ;;



let _ =   
          
             progList := ([]:program) ; 
             query := ([]:atom list) ;
             qOn := false ;
            while true do
              print_string "?- ";
              let inp = read_line() in
              if inp="." then exit 0
              else  
                if (inp.[0] = '[') then (workonfile inp)
                else (* query := ([]:body) ; workonquery inp *) (workonquery inp)
                 
          done
          ;;

