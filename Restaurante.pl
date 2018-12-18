/* Restaurante */

entrada(paella).
entrada(gazpacho).
entrada(consome).
carne(filete_de_cerdo).
carne(pollo_asado).
pescado(trucha).
pescado(bacalao).
postre(flan).
postre(nueces_con_miel).
postre(naranja).

calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_de_cerdo, 300).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja, 50).

maindish(X) :- carne(X) ; pescado(X).
food(X,Y,Z) :- entrada(X) , maindish(Y) , postre(Z).
calories(X,Y,Z,C) :- food(X,Y,Z) ,
					 calorias(X,C1) ,
					 calorias(Y,C2) ,
					 calorias(Z,C3) ,
					 C is C1 + C2 + C3.
					 
limit(X,Y,Z,C) :- calories(X,Y,Z,C) , C < 800.



















