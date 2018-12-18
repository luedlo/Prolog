/* Multiplicacion de dos Numeros */

mult(N,0,0).
mult(N,1,N).
mult(N1,N2,A) :- N1 > 0 ,
				 N is N1 - 1 ,
				 mult(N,N2,R),
				 R is A + N2.
				 