fibo(0,0).
fibo(1,1).
fibo(N, X) :-   N > 0 ,
				N1 is N-1 ,
				fibo(N1,R1) ,
				N2 is N-2 ,
				fibo(N2,R2) ,
				X is R1+R2.