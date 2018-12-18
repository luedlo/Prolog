% Exercise 3.2 Matryoshka Dolls

inside('Olga', 'Katarina').
inside('Natasha', 'Olga').
inside('Irina', 'Natasha').

containsTo(X,Y) :- inside(X,Y).
containsTo(X,Z) :- inside(X,Y) , containsTo(Y,Z).