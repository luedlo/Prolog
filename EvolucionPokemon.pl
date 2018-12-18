% Evolucion Pokemon

evolution('Bulbasaur','Huevo').
evolution('Ivysaur','Bulbasaur').
evolution('Venasaur','Ivysaur').

was(X,Y) :- evolution(X,Y).
was(X,Z) :- evolution(X,Y) , was(Y,Z).

willBe(X,Y) :- evolution(Y,X).
willBe(X,Z) :- evolution(Y,X) , willBe(Y,Z).