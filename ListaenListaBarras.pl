list([]).
list([L|LL]) :- doAsterisk(L) ,
				nl ,
				list(LL).
					 
doAsterisk(Z) :- Z =< 0.
doAsterisk(Z) :- Z > 0 ,
				 write('*') ,
				 A is Z - 1 ,
				 tab(1) ,
				 doAsterisk(A).