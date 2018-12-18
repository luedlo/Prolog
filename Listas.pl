perros(pastor_aleman, [solvino, dino, oso]).
perros(san_bernardo, [riky, bella, majestad]).
perros(french_poodle, [paloma, piojo, livier]).

pertenece(E,L) :- L = [E|_].
pertenece(E,[_|T]) :- pertenece(E,T).

pastor_aleman(P) :- perros(pastor_aleman, L), pertenece(P,L).
raza(R) :- perros(_,L), pertenece(R,L).