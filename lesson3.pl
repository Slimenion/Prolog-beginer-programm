max(X, Y, X):- X > Y, !. 
max(_, Y, Y):- X < Y, !.

fact(1,1).
fact(N,X):- N>1,N1 is N-1, fact(N1,X1), X is X1*N.

factDown(1,1).
factDown(N,X):- factDown(N,X,1,1).
factDown(N,X,N,X):- !.
factDown(N,X,N1,X1):- N11 is N1+1, X11 is X1*N11, factDown(X, N, N11, X11). 

fib(1, 1).
fib(2, 1).
fib(N, X):- N1 is N-1,
            N2 is N-2,
            fib(N1, X1),
            fib(N2, X2),
            X is X1 + X2.

fib2(N,X):- fib2(N, X, 1, 1, 0).
fib2(N,X,N,X, _):-!.
fib2(N,X,K,X1,X0):- K1 is K + 1,
                    X2 is X0 + X1,
                    fib2(N,X,K1,X2,X1).