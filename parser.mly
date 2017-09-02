%{

open Execute ;;

%}

%token <string> PHRASE VOP
%token COMMA FSTOP TRUE FALSE LPAREN RPAREN HYPHEN COLON EOL


        %start main expr             /* the entry point */
        %type <Execute.program> main 
        %type <Execute.atom> expr 
%%

main:         
gadha          { $1 }
|main gadha      { progList:=($1 @ $2) ;$1 @ $2 }

;

gadha:
    expr FSTOP EOL                         { ([($1,[])]) ;}
    |expr COLON HYPHEN yoma FSTOP EOL      { ([($1,$4)]) ;}                       

 
;

yoma:

|expr                 { [$1] }
|expr COMMA expr     { [$1] @ [$3] } 

;

expr:
PHRASE LPAREN inside RPAREN     { if !qOn then query:=[Predicate($1,$3)];Predicate($1,$3) }

;

inside:
PHRASE                  { [Cons($1)] }  
|VOP                    { [Var($1)] }          
|VOP COMMA inside       { [Var($1)] @ $3 }
|PHRASE COMMA inside    { [Cons($1)] @ $3 }

;










