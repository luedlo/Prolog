
peleador('Goten').
peleador('Trunks').
peleador('Gohan').
peleador('Vegeta').
peleador('Goku').
peleador('Freezer').
peleador('Picoro').
peleador('Dabura').
peleador('Cell').
peleador('Majinbuu').
peleador('Goten').

terricola('Goten','Tierra').
terricola('Trunks','Tierra').

siConoceA('Gohan','KaioSama').

conCola('Vegeta').
conCola(X):-terricola(X,'Tierra').


fusionar(T,G) :- conCola(T) , conCola(G).
'Goten'(T,G)  :- fusionar(T,G) , ((T='Goten',G='Trunks') ; (T='Trunks',G='Goten')).


ssjx(S) :- S='Goten';
		   S='Trunks';
		   S='Gohan';
		   S='Vegeta';
		   S='Goku',
		   S='Goten'.
		   
ssj1(S) :- ssjx(S).
ssj2(S) :- ssj1(S) , S\='Goten'.
ssj3(S) :- ssj2(S) ; (S='Goten';S\='Gohan';S\='Vegeta').


ssj4(S) :- ssj3(S) ; (S='Vegeta', conCola(S)). 
ssjm(S) :- (S='Gohan' , siConoceA(S,'KaioSama') , ssj2(S)).

absorbeA('Majinbuu','Gohan').

ssj1VenceA('Freezer').
ssj2VenceA('Freezer').
ssj2VenceA('Cell').
ssj2VenceA('Dabura').
ssj2VenceA('Picoro').
ssj3VenceA('Majinbuu').
ssj3VenceA('Majinbuu') :- not(absorbeA('Majinbuu',X)).




vence(X,Y):-(). 
% Una disculpa a los compañeros que vayan a leer, esto no pude continuar 
haciendolo por que se me hizo algo tarde y mi cabeza ya no daba para
mas y probablemente me falten cosas que no haya notado o considerado ademas
del predicado vence(:v).




































