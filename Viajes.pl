enCarro(newYork,hamilton).
enCarro(newYork,hamilton).
enCarro(hamilton,francia).
enCarro(valmont,roma).
enCarro(valmont,metz).

enTren(metz,frankfurt).
enTren(roma,frankfurt).
enTren(metz,paris).
enTren(roma,paris).

enAvion(frankfurt,bangkok).
enAvion(frankfurt,singapore).
enAvion(paris,losAngeles).
enAvion(bangkok,newYork).
enAvion(singapore,newYork).
enAvion(losAngeles,newYork).

connected(X,Y) :- enCarro(X,Y) ; enTren(X,Y) ; enAvion(X,Y).

travel(X,Y) :- connected(X,Y).
travel(X,Z) :- connected(Y,Z) , travel(X,Y).

transport(X,Y,enCarro) :- enCarro(X,Y).
transport(X,Y,enTren) :- enTren(X,Y).
transport(X,Y,enAvion) :- enAvion(X,Y).

transport2(X,Y,Z) :- 
	enCarroX,Y)  , Z = enCarro;
	enTren(X,Y)  , Z = enTren;
	enAvion(X,Y) , Z = enAvion.












