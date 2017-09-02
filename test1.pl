male(shantanu).
female(satyavati).
female(ganga).
male(parashara).
male(bhishma).
male(vichitrvirya).
male(vyasa).
male(chitrangada).
female(ambalika).
female(ambika).
child(bhishma,shantanu,ganga).
child(vichitrvirya,shantanu,satyavati).
child(chitrangada,shantanu,satyavati).
married(vichitrvirya,ambalika).
married(vichitrvirya,ambika).
male(dhritrashtra).
female(gandhari).
married(dhritrashtra,gandhari).
female(draupadi).
male(shakuni).
female(kunti).
male(pandu).
female(madri).
male(karna).
male(yudhisthir).
male(bhima).
male(arjun).
male(nakula).
male(sahadeva).
female(subhadra).
child(dhritrashtra,vichitrvirya,ambika).
child(pandu,vichitrvirya,ambalika).
brother(gandhari,shakuni).
married(pandu,kunti).
child(yudhisthir,pandu,kunti).
child(bhima,pandu,kunti).
child(arjun,pandu,kunti).
married(pandu,madri).
child(nakula,pandu,madri).
child(sahadeva,pandu,madri).
married(arjun,subhadra).
child(karna,random_man1,kunti).
married(yudhisthir,draupadi).
married(bhima,draupadi).
married(arjun,draupadi).
married(nakula,draupadi).
married(sahadeva,draupadi).
male(abhimanyu).
child(abhimanyu,arjun,subhadra).
female(uttara).
married(abhimanyu,uttara).
male(parikshit).
child(parikshit,abhimanyu,uttara).
male(janmejaya).
child(janmejaya,parikshit,random_woman1).
male(duryodhana).
female(dussala).
male(dushasana).
child(duryodhana,dhritrashtra,gandhari).
child(dussala,dhritrashtra,gandhari).
child(dushasana,dhritrashtra,gandhari).
wife(X,Y):- female(Y), married(X,Y).
wife(X,Y):- female(Y), married(Y,X).
husband(X,Y):-wife(Y,X).
father(X,Y):-male(Y),child(X,Y,Z).
father(X,Y):- male(Y),child(X,Z,Y).
mother(X,Y):-female(Y),child(X,Z,Y).
mother(X,Y):-female(Y),child(X,Y,Z).
son(X,Y):- male(Y),father(Y,X).
son(X,Y):- male(Y),mother(Y,X).
daughter(X,Y):-female(Y),father(Y,X).
daughter(X,Y):-female(Y),mother(Y,X).
parent(X,Y):-father(X,Y).
parent(X,Y):-mother(X,Y).
sibling(X,Y):-sister(X,Y).
sibling(X,Y):-brother(X,Y).
grandfather(X,Y):-child(X,A,B),father(A,Y).
grandfather(X,Y):-child(X,A,B),father(B,Y).
grandmother(X,Y):-child(X,A,B),mother(A,Y).
grandmother(X,Y):-child(X,A,B),mother(B,Y).
grandparent(X,Y):-grandmother(X,Y).
grandparent(X,Y):-grandfather(X,Y).
uncle(X,Y):-parent(X,A),brother(A,Y).
aunt(X,Y):-parent(X,A),sister(A,Y).
nephew(X,Y):- male(Y),uncle(Y,X).
nephew(X,Y):- male(Y),aunt(Y,X).
niece(X,Y):- female(Y),uncle(Y,X).
niece(X,Y):- female(Y),aunt(Y,X).
grandchild(X,Y):-grandparent(Y,X).
descendant(X,X).
descendant(X,Y):-parent(A,X),descendant(A,Y).
ancestor(X,Y):-descendant(Y,X).
