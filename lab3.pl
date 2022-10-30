max(X, Y, X):- X > Y, !. 
max(_, Y, Y):- !.

min(X, Y, X):- X < Y, !.
min(_, Y, Y):- !.

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

sum(X,X):- X<10.
sum(X,S):- X>=10, 
        X1 is X div 10,
        OST is X mod 10,
        sum(X1,S1),
        S is OST + S1.

sum2(0, X):- X is 0, !.
sum2(X, S):- OST is X mod 10,
        X1 is X div 10,
        sum(X1, S1),
        S is OST+S1.

maxNumber(num, num, num).
maxNumber(0, X, X):- !.
maxNumber(X, Y, Z):- X1 is X mod 10, X1 > Y, !, X2 is X div 10, maxNumber(X2, X1, Z).
maxNumber(X, Y, Z):- X1 is X div 10, maxNumber(X1, Y, Z).

sumDigit3(0,X):- X is 0, !.
sumDigit3(N,X):- N1 is N mod 10,
                NN is N div 10,
                N2 is N1 mod 3,
                sumDigit3(NN, X1),
                ((N2>0, X is X1); (X is X1 + N1)).

maxNumberNOD(0, _, X):- X is 0, !.
maxNumberNOD(N, Z, X):- N1 is N mod 10,
                NN is N div 10,
                checkNOD(N1,Z, N2),
                maxNumberNOD(NN,Z, X1),
                ((N2==1, X is X1); (X is X1 + 1)).

% хвостовая рекурсия это рекурсия вниз
maxDivisor(X):- maxDivisor(X,0,X).
maxDivisor(X, 0, X):- !.
maxDivisor(X, Y, Ost):- max(X,Y,Max), min(X,Y,Min), Var is Max mod Min, maxDivisor(Min, Var, Ost).

% :- discontiguous checkSimple/3.
% checkSimple(X, X, Y):- (Y>2), !; .
% checkSimple(X):- checkSimple(X, 1, 0).
%checkSimple(X, CurDiv, QuanityDiv):- Ost is X mod CurDiv, CurDiv1 is CurDiv + 1, ((Ost==0, QuanityDiv1 is QuanityDiv + 1, checkSimple(X,CurDiv1,QuanityDiv1));(checkSimple(X,CurDiv1,QuanityDiv))).

isDivisible(Number, Divisor):-
  Number mod Divisor = 0, !.
isDivisible(Number, Divisor):-
  (Divisor * Divisor) < Number,
  NextDivisor is Divisor + 1,
  isDivisible(Number, NextDivisor).

isPrime(1):-!.
isPrime(Number):-
  Number > 0,
  not(isDivisible(Number, 1)).

all_factors(Number,Z):-
  all_factors(Number, Z, 1).
all_factors(Number, _, Factor):-
 Factor > Number, !.
all_factors(Number, Z, Factor):-
 0 is Number mod Factor, Z is Factor.
all_factors(Number, Z, Factor):-
 NextFactor is Factor + 1,
 all_factors(Number, Z, NextFactor).

quanityDiv(X):- quanityDiv(X, 1, 1).
quanityDiv(X, X, Y):- write(Y),nl.
quanityDiv(X, CurDiv, QuanityDiv):- Ost is X mod CurDiv, CurDiv1 is CurDiv + 1, ((Ost==0, QuanityDiv1 is QuanityDiv + 1, quanityDiv(X,CurDiv1,QuanityDiv1));(quanityDiv(X,CurDiv1,QuanityDiv))).


checkNOD(A, B, GCD):-
    ((A=0; B=0), GCD is 0, !); 
    (
      AmB is A mod B,
      BmA is B mod A,
      (
        AmB == 0, !, GCD is B;
        BmA == 0, !, GCD is A;
        A > B, !, checkNOD(AmB, B, GCD);
        checkNOD(A, BmA, GCD)
      )
    ).

checkAll(X):- 
    (
    	X1 is X mod 2, X1=0, X1 is X mod 3, X1=0, X1 is X mod 5, X1=0, X1 is X mod 7, X1=0,
      	maxNumberNOD(X, 2, A), maxNumberNOD(X, 3, B), maxNumberNOD(X, 5, C), maxNumberNOD(X, 7, D),
        (
          ((A >= B, A >= C, A >= D), write(A), write(" "), write(B),write(" "), write(C), write(" "), write(D), nl, write("answer 2"), !);
          ((B >= A, B >= C, B >= D), write(A), write(" "), write(B),write(" "), write(C), write(" "), write(D), nl, write("answer 3"), !);
          ((C >= A, C >= B, C >= D), write(A), write(" "), write(B),write(" "), write(C), write(" "), write(D), nl, write("answer 5"), !);
          ((D >= A, D >= C, D >= C), write(A), write(" "), write(B),write(" "), write(C), write(" "), write(D), nl, write("answer 7"), !)
        )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 3, X1=0, X1 is X mod 5, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 3, B), maxNumberNOD(X, 5, C),
      (
        ((A >= B, A >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(235) 2"), !);
       	((B >= A, B >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(235) 3"), !);
        ((C >= A, C >= B), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(235) 5"), !)
      )
    );
    (
      X1 is X mod 3, X1=0, X1 is X mod 5, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 3, A), maxNumberNOD(X, 5, B), maxNumberNOD(X, 7, C),
      (
        ((A >= B, A >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(357) 3"), !);
       	((B >= A, B >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(357) 5"), !);
        ((C >= A, C >= B), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(357) 7"), !)
      )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 5, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 5, B), maxNumberNOD(X, 7, C),
      (
        ((A >= B, A >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(257) 2"), !);
       	((B >= A, B >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(257) 5"), !);
        ((C >= A, C >= B), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(257) 7"), !)
      )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 3, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 3, B), maxNumberNOD(X, 7, C),
      (
        ((A >= B, A >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(237) 2"), !);
       	((B >= A, B >= C), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(237) 3"), !);
        ((C >= A, C >= B), write(A), write(" "), write(B),write(" "), write(C), nl, write("answer(237) 7"), !)
      )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 3, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 3, B),
      (
          (A >= B,  write(A), write(" "), write(B), nl, write("answer(23) 2"), !);
          (write(A), write(" "), write(B), nl, write("answer(23) 3"), !)
      )
    );
    (
      X1 is X mod 5, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 5, A), maxNumberNOD(X, 7, B),
      (
          (A >= B, write(A), write(" "), write(B), nl, write("answer(57) 5"), !);
          (write(A), write(" "), write(B), nl, write("answer(57) 7"), !)
      )
    );
    (
      X1 is X mod 3, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 3, A), maxNumberNOD(X, 7, B),
      (
          (A >= B, write(A), write(" "), write(B), nl, write("answer(37) 3"), !);
          (write(A), write(" "), write(B), nl, write("answer(37) 7"), !)
      )
    );
    (
      X1 is X mod 3, X1=0, X1 is X mod 5, X1=0,
      maxNumberNOD(X, 3, A), maxNumberNOD(X, 5, B),
      (
          (A >= B, write(A), write(" "), write(B), nl, write("answer(35) 3"), !);
          (write(A), write(" "), write(B), nl, write("answer(35) 5"), !)
      )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 7, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 7, B),
      (
          (A >= B, write(A), write(" "), write(B), nl, write("answer(27) 2"), !);
          (write(A), write(" "), write(B), nl, write("answer(27) 7"), !)
      )
    );
    (
      X1 is X mod 2, X1=0, X1 is X mod 5, X1=0,
      maxNumberNOD(X, 2, A), maxNumberNOD(X, 5, B),
      (
          (A >= B, write(A), write(" "), write(B), nl, write("answer(25) 2"), !);
          (write(A), write(" "), write(B), nl, write("answer(25) 5"), !)
      )
    );
    (   
      X1 is X mod 2, X1=0,
       	write("answer 2"), !
    );
    (   
      X1 is X mod 5, X1=0,
     	write("answer 5"), !
    );
    (   
      X1 is X mod 7, X1=0,
    	write("answer 7"), !
    );
    (   
      X1 is X mod 3, X1=0,
      	write("answer 3"), !
    ).
    
    