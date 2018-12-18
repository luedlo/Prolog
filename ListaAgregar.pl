/* Add elements at start to the list */
add(A,[],[A]).
add(A,L,[A|L]).

/* Add elements at end to the list */
addEnd(A,[],[A]).
addEnd(A,[H|T],[H|T1]) :- addEnd(A,T,T1).

/* Return position of any element */
returnP(1,[H|T],H).
returnP(N,[H|T],ANS) :- N1 is N - 1 , 
						returnP(N1,T,ANS).

/* Length of the list */						
lengthL([],0).
lengthL([H|T],C) :- lengthL(T,C1), 
				    C is C1 + 1.