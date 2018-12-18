writeList([]).
writeList([L|LL]) :- doline(L) ,
					 nl ,
					 writeList(LL).
					 
doline([]).
doline([X|L]) :- write(X) ,
				 tab(1) ,
				 doline(L).