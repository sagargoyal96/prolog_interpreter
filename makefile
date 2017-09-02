make:
	ocamlc -c execute.ml
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamllex lexer.mll
	ocamlc -c parser.ml
	ocamlc -c lexer.ml
	ocamlc -c main.ml
	ocamlc execute.cmo lexer.cmo parser.cmo main.cmo
