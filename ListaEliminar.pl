eliminar(_,[],[]).
eliminar(NE,[NE|T],T).
eliminar(NE,[H|T],[H|T1]) :- eliminar(NE,T,T1).
 