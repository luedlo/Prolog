lista([[normal,100],[safari,200],[super,300],[master,400]]).

recorrer() :- lista(L) , separar(L).
separar([H|T]) :- imprimir(H) , separar(T).
imprimir([H|[T]]) :- write(H) , write(' costo: ') , write(T)  , nl.  

/**************************************************************/

:- dynamic lista2/2.
lista2([[a,b,c],[[1,2],[3,4]]]).

mod(V) :- lista2(L) , modificar(L,V).
modificar([L,[L1,[H|T]]],V) :- retract(lista2([_])).


mostrar() :- lista2(L) , mostrar(L).
mostrar([_,[_,[H|T]]]) :- write(H) , write(T).
 



/*  , asserta(lista2([L,[L1,[H|V]]])).
eliminar(NE,[NE|T],T).
eliminar(NE,[H|T],[H|T1]) :- eliminar(NE,T,T1).

addEnd(A,[],[A]).
addEnd(A,[H|T],[H|T1]) :- addEnd(A,T,T1).
*/