/* Sumatoria de los Numeros Menores a N */

sum(N,1) :- N=<1.
sum(N, X) :-  	N > 0 ,
				N1 is N - 1 ,
				sum(N1,R1) ,
				X is N + R1.