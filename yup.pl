edge(a,b).
edge(b,c).
edge(b,d).
path(X,X).
path(X,Y):- edge(X,Z),path(Z,Y).