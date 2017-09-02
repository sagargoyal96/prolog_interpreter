type term = Var of string | Cons of string | Node of string* term list ;;
type atom = Predicate of string * term list ;;
type fact = atom ;;
type rule = atom * atom list ;;
type clause = atom * atom list ;;  
type program  = clause list ;;
type subsi= (string * term) list ;;

type send= One of subsi* atom list | Zero of subsi * atom list ;;


exception Not_unifiable;;
exception Not_found;;

let progList = ref ([]:program) ;;
let query = ref ([]:atom list) ;;
let qOn = ref false ;; 


;;

let rec li_size l1 acc= match l1 with
|[]->acc
|hd::tl-> (li_size tl (acc+1))
;;

module MyUsers = Map.Make(String);;
let mapp=MyUsers.empty ;;


let rec makemap subs mapp2 = match subs with
[] -> mapp2;
| hd :: tl -> let mapp1 = MyUsers.add (fst hd) (snd hd) mapp2 in makemap tl mapp1
;; 

let mapmade (subs:subsi) = makemap subs mapp
;;
 

let rec vars preterm (acc:string list) = match preterm with
Var(s)-> s::acc
|Cons(a) -> acc
| Node(sym,li) -> let f acco ter =
				  acco @ (vars ter acc)
				  in let pp = List . fold_left f [] li in
				  pp

				;;


(*
let rec subst (rep:term) (x:string) (a1:term)  = match a1 with
V(Var(a))-> if a=x then rep else a1 
| Node(sym,l1) -> Node(sym, List . map (subst rep x) l1)
	
;;
*)

  
let rec substitute subs (a1:term) = match a1 with
Var(a)-> if (MyUsers.mem a subs) then  MyUsers.find a subs else Var(a)
| Node(sym,l1) -> Node(sym, List . map (substitute subs) l1)
| Cons(a) -> Cons(a)

;;

let substitution (subs:subsi) (a1:term)=substitute (mapmade subs) a1
;;

(*
let rec compo (lisofsubs:subsi list) (a1:term) = match lisofsubs with
[]-> a1
| hd::tl ->compo tl (substitute hd a1)
;;

*)


let rec substi1 x (a1:term) (a2:term) = match a2 with
Var(a) -> if a=x then a1 else a2
| Node(sym,l1) -> Node(sym, List . map (substi1 x a1) l1)

;;

let rec composi (subs:subsi) (a1:term) = match subs with
[]-> a1
| hd::tl -> composi tl (substi1 (fst hd) (snd hd) a1)
;;

let rec is_memberspl x a1 = match a1 with
[]-> false
| hd::tl -> if hd=x then true else (is_memberspl x tl)
;;

let rec is_mem_term (x:string) (a1:term) = 
	is_memberspl x (vars a1 [])
;;





let rec is_mem_new x l1= match l1 with
[]-> false
| hd::tl -> if fst hd=fst x then true else (is_mem_new x tl)
;;

let rec compose2 (l1:(string * term) list) (l2:subsi) =  match l2 with
[]->l1
| x::xs -> if (is_mem_new x l1) then compose2 l1 xs
		else x::(compose2 l1 xs) 
	;;


let compose1 (sub1:subsi) (sub2:subsi) = let guy1 li = ((fst li), substitution sub2 (snd li)) in 
	List . map (guy1) sub1 
;;


let rec compose (l1:subsi) (l2:subsi) = compose2 (compose1 l1 l2) l2
;;	

let rec appe l1 l2 = match l1,l2 with
[],[]->[]
|(hd1::tl1),(hd2::tl2) -> (hd1,hd2)::(appe tl1 tl2)
;;







let rec mgu t1 t2 = match t1,t2 with
Var(a),Var(b) -> if a=b then [] else [a,Var(b)]  
| Var(a), Node(sym1,l1) -> if (is_mem_term a (Node(sym1,l1))) then raise Not_unifiable
else [a, Node(sym1,l1)]

| Node(sym1,l1),Var(a) -> if (is_mem_term a (Node(sym1,l1))) then raise Not_unifiable
else [a, Node(sym1,l1)]
|Var(a),Cons(b) -> [a,Cons(b)]
|Cons(b),Var(a) -> [a,Cons(b)]
|Cons(a),Cons(b) -> if a=b then [] else raise Not_unifiable
|Cons(b),Node(sym1,l1) -> raise Not_unifiable
|Node(sym1,l1),Cons(a) -> raise Not_unifiable

| Node(sym1,l1),Node(sym2,l2) -> if sym1=sym2 && l1=l2 then [] else if 
 									sym1=sym2  then let sd = (appe l1 l2) in 
 let ffunc acc eterm =  compose acc (mgu (substitution acc (fst eterm)) (substitution acc (snd eterm)))  in
 List.fold_left ffunc [] sd

  else raise Not_unifiable
;;


 let rec gen_mgu a1 a2 =
  match a1,a2 with
 Predicate(a,b), Predicate(c,d) ->  mgu (Node(a,b)) (Node(c,d))
;;




let rec ch_fact quer a1 = match a1 with

[]-> false
|x::xs -> if x=quer then true else ch_fact quer xs 
;;

(* 
//clause and atom *)

let atomtonode l1= match l1 with
Predicate(a,b) -> Node(a,b)
;;

let nodetoatom l1 =match l1 with
Node(a,b) -> Predicate(a,b)
;;




let atom_subsi s1 a1 =(nodetoatom (substitution s1 (atomtonode a1)))
;;






let rec fir_mer l1 a1 acc= match l1 with
[]->acc
|hd::tl ->( match hd with
		(a,[]) -> (try let mgutry= (gen_mgu a a1) in (fir_mer tl a1 acc@[One(mgutry, [])]) with Not_unifiable -> (fir_mer tl a1 acc@[Zero([],[])]))
		|(a,b) -> try let mgutry= (gen_mgu a a1) in (fir_mer tl a1 acc@[One(mgutry, b )]) with Not_unifiable -> (fir_mer tl a1 acc@[Zero([],[])])
		)
;;
exception Empty_PList;;
exception Pcrux;;



let rec vars acc preterm = match preterm with
Var(s)-> if (is_memberspl s acc) then acc else s::acc
|Cons(a) ->acc
| Node(sym,li) -> let f acco ter =
				  acco @ (vars acc ter)
				  in let pp = List . fold_left f [] li in
				  pp

				;;




let rec variab goal acc= match goal with
	|Predicate(a,b)-> List.fold_left vars acc b
;;

let rec print_subsi (subs) goa_li = match subs with
(a,b) -> if (is_memberspl a goa_li) then 
	(match b with 
				Var(k) ->print_string(a^" = " ^ k)
				| Cons(k) -> print_string(a^" = " ^ k)	)

	else ()
;;			 

let rec pri_substi (subs:subsi) goa_li =
let varii= (variab goa_li []) in
 match subs with
[]->()
|hd::tl -> (print_subsi hd varii ) ; print_string(" "); (pri_substi tl goa_li )
;;

let rec newatom (ato:atom)= match ato with
Predicate(a,b) -> let func ter= match ter with
					
						Var(a)->Var(a^"p")
						|Cons(a) -> Cons(a) 
					in
					Predicate(a,(List.map func b))

 ;;
exception NAHI;;

let rec newclau (pro:clause) = match pro with
(a,[]) -> ((newatom a),[])
|(a,b) -> ((newatom a), (List.map newatom b))

;;

let rec newprog prog = match prog with
[]->[]
|hd::tl -> (newclau hd)::(newprog tl)

;; 


let rec crux prog goal o_goal acc = match goal with
[]-> (pri_substi acc o_goal) ; print_string(" "); if read_line()=";" then raise Pcrux else acc 
|hd::tl -> let aol = (fir_mer (newprog prog) (atom_subsi acc hd) []) in
				let rec tupp x = ( match x with
									 []-> raise Empty_PList	
								     |hd1::tl1-> (match hd1 with
										   One(a,b) -> (try let subd = (crux (newprog prog) (b@tl) o_goal (compose a acc)) in subd with Pcrux -> tupp tl1 )
										   |Zero(a,b) -> tupp tl1
												)
										) in (try let subbb = tupp aol in (subbb) with Empty_PList -> raise Pcrux)


	;;					   		


(* 
		match (fir_mer prog (atom_subsi acc hd) []) with
			hd1::tl1 -> match hd1 with 
					One(a,b) -> ( crux prog (b@tl) (a@acc) )
					|Zero(a,b) -> []	

 *)


(* 
let rec merge com (l1:clause list) (at:atom) = 

 let ffnc acc eterm = match eterm with
 (a,[]) -> (try let mgutry= (gen_mgu a at)  in ((compose acc mgutry),[]) with Not_unifiable -> ([],[]))
 |(a,b) -> (try let mgutry= (gen_mgu a at) in ((compose acc mgutry), b ) with Not_unifiable -> ([],[]))
in
 List.fold_left ffnc com l1

*)





