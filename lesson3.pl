max(X, Y, X):- X > Y, !. 
max(_, Y, Y):- X < Y, !.

fact(1,1).
fact(N,X):- N>1,N1 is N-1, fact(N1,X1), X is X1*N.

factDown(1,1).
factDown(N,X):- factDown(N,X,1,1).
factDown(N,X,N,X):- !.
factDown(N,X,N1,X1):- N11 is N1+1, X11 is X1*N11, factDown(X, N, N11, X11). 

fib(1).

fib(N, X):-