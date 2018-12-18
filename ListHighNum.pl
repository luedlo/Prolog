%The higher number

numMax([H|T],Max) :-  numMax(T, H, Max).

numMax([],A,A).
				   
numMax([H|T],A,Max) :- 
						H > A ,
						numMax(T, H, Max).
numMax([H|T],A,Max) :-
						H =< A ,
						numMax(T, A, Max).

