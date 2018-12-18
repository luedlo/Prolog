
% - - - BASE DE CONOCIMIENTO - - -
:- dynamic pokemochila/4.
:- dynamic bill/1.
:- dynamic estatus/5.
:- dynamic gimnasios/1.

pokemochila(
	[],  %Pokemones
	[[pokeball,5],[superball,3],[ultraball,1],[masterball,0]],  %pokebolas
	500,   %Dinero
	[]). %Medallas

%NombreEntrenador-Pokemones_Huevos
bill([	[entrenador, [poke1,pok2,hue1,hue2] ]	]).

%Nombre-Pokemones-Dinero-CiudadActual-Medallas
estatus(nombre,0,500,0,0).

mapa([
[0,este,1,5],
[1,oeste,0,5],
[1,sur,2,4],
[2,norte,1,4],
[2,oeste,3,7],
[2,sur,5,9],
[3,este,2,7],
[3,sur,4,7],
[4,norte,3,7],
[4,este,5,5],
[5,oeste,4,5],
[5,norte,3,9],
[5,este,6,6],
[6,oeste,5,6]]).

pokebolas([
	[pokeball,100],
	[superball,200],
	[ultraball,500],
	[masterball,999]
          ]).

ataquesLista([[hiperrayo,20],
		[destello,10],
		[placaje,10],
		[corte,15],
		[doblefilo,25],
		[metronomo,10],
		[velocidadextrema,20],
		[golpecuerpo,20]]).

tipoPokemones([electrico,fuego,planta,agua,volador]).

estadoPokemones([full,debilitado,muerto]).

%Pokemon-Tipo-Poder- Los otros dos numeros sirven para la eleccion aleatoria de las peleas
pokemones(pichu,electrico,50,1,1).
pokemones(chinchou,electrico,60,1,2).
pokemones(magnemite,electrico,45,1,3).
pokemones(charmander,fuego,45,2,1).
pokemones(growlithe,fuego,50,2,2).
pokemones(ponyta,fuego,65,2,3).
pokemones(bulbasaur,planta,50,3,1).
pokemones(oddish,planta,55,3,2).
pokemones(exeggcute,planta,65,3,3).
pokemones(squirtle,agua,55,4,1).
pokemones(poliwag,agua,45,4,2).
pokemones(tentacool,agua,60,4,3).
pokemones(pidgey,volador,50,5,1).
pokemones(zubat,volador,55,5,2).
pokemones(natu,volador,55,5,3).

%Ataques de todos los pokemones
ataques(pichu,[[hiperrayo,20],[destello,10],[corte,15],[metronomo,10]]).
ataques(chinchou,[[hiperrayo,20],[destello,10],[corte,15],[golpecuerpo,20]]).
ataques(magnemite,[[hiperrayo,20],[destello,10],[velocidadextrema,20],[placaje,10]]).
ataques(charmander,[[placaje,10],[destello,10],[corte,15],[golpecuerpo,20]]).
ataques(growlithe,[[corte,15],[golpecuerpo,20],[hiperrayo,20],[metronomo,10]]).
ataques(ponyta,[[doblefilo,25],[metronomo,10],[placaje,10],[destello,10]]).
ataques(bulbasaur,[[metronomo,10],[doblefilo,25],[corte,15],[golpecuerpo,20]]).
ataques(oddish,[[velocidadextrema,20],[doblefilo,25],[corte,15],[destello,10]]).
ataques(exeggcute,[[golpecuerpo,20],[doblefilo,25],[corte,15],[placaje,10]]).
ataques(squirtle,[[placaje,10],[destello,10],[golpecuerpo,20],[metronomo,10]]).
ataques(poliwag,[[golpecuerpo,20],[doblefilo,25],[placaje,10],[corte,15]]).
ataques(tentacool,[[placaje,10],[metronomo,10],[corte,15],[destello,10]]).
ataques(pidgey,[[golpecuerpo,20],[velocidadextrema,20],[hiperrayo,20],[corte,15]]).
ataques(zubat,[[placaje,10],[destello,10],[hiperrayo,20],[golpecuerpo,20]]).
ataques(natu,[[golpecuerpo,20],[metronomo,10],[corte,15],[velocidadextrema,20]]).
%Obtenemos los ataques de los pokemones evolucionados una ves
ataques(Evolucion1,Lista):-pokemones(Nombre,_,_,_,_),evoluciones(Nombre,[Evolucion1|_],_),ataques(Nombre,Lista).
%Obtenemos los ataques de los pokemones evolucionados dos veces
ataques(Evolucion2,Lista):-pokemones(Nombre,_,_,_,_),evoluciones(Nombre,_,[Evolucion2|_]),ataques(Nombre,Lista).

%Pokemon-Evolucion-ExperienciaRequerida-aumentoDePoder
evoluciones(pichu,[pikachu,100,20],[ev2,300,25]).
evoluciones(chinchou,[lanturn,100,22],[ev2,300,20]).
evoluciones(magnemite,[magneton,100,24],[ev2,300,23]).
evoluciones(charmander,[charmeleon,100,18],[ev2,300,24]).
evoluciones(growlithe,[arcanine,100,25],[ev2,300,25]).
evoluciones(ponyta,[rapidash,100,20],[ev2,300,27]).
evoluciones(bulbasaur,[ivysaur,100,20],[ev2,300,30]).
evoluciones(oddish,[gloom,100,21],[ev2,300,21]).
evoluciones(exeggcute,[exeggutor,100,22],[ev2,300,23]).
evoluciones(squirtle,[wartortle,100,24],[ev2,300,25]).
evoluciones(poliwag,[poliwhirl,100,22],[ev2,300,22]).
evoluciones(tentacool,[tentacruel,100,21],[ev2,300,25]).
evoluciones(pidgey,[pidgeotto,100,23],[ev2,300,30]).
evoluciones(zubat,[golbat,100,23],[ev2,300,23]).
evoluciones(natu,[xatu,100,24],[ev2,300,25]).

%TipoDeHuevo-KmParaEclocionar
huevos([electrico,18],[fuego,15],[planta,10],[agua,15],[volador,8]).


% - - - PREDICADOS - - - 
play:- reiniciar,inicio,menu.


reiniciar:-
		retractall(pokemochila(_,_,_,_)),
		assertz(pokemochila(
							[],  %Pokemones
							[[pokeball,5],[superball,3],[ultraball,1],[masterball,0]],  %pokebolas
							500,   %Dinero
							[]	%Medallas
							)),
		retractall(bill(_)), 
		assertz(bill([	[entrenador, [poke1,pok2,hue1,hue2] ]	])),
		retractall(estatus(_,_,_,_,_)), 
		assertz(estatus(jugador,0,500,0,0)),
		retractall(gimnasios(_)),
		assertz(gimnasios([[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]])).

inicio:-write("\n\n-------Bienvenido a MINI-POKEMON WORLD-------\n\n"),
		write("Porfavor, escribe tu nombre como jugador: "),
		read(Nombre),estatus(A,B,C,D,E),retract(estatus(A,B,C,D,E)),assertz(estatus(Nombre,B,C,D,E)),
		write("\n"),write(Nombre),write(" apartir de hoy eres un entrenador Pokemon, tu objetivo es ganar seis medallas,\n"),
		write("las cuales puedes obtener venciendo a otros entrenadores pokemon en los gimnacios. \n"),
		write("En este mundo existen 5 Tipos de pokemones \n\n"),
		write("(1)\telectrico\n(2)\tfuego\n(3)\tplanta\n(4)\tagua\n(5)\tvolador\nIngresa el numero del que deces: "),
		read(Tipo),elegirPoke(Tipo),
		write("\nSe te asignara aleatoriamente tu primer pokemon del tipo que has elegido, tu primer pokemon es\n\n"),
		pokemochila([[NombreP,TipoP,Poder,_,_]|_],_,_,_),
		write(NombreP),write("!!!, es de tipo "),write(TipoP),write(" con un poder de "),write(Poder),
		write("\nActualmente, tu nuevo pokemon tiene 0 experiencia, gana batallas para obtener experiencia,\n"),
		write("asi evolucionaran tus pokemones, y aumentara su poder.\n\n"),
		write("En este momento te encuentras en la primera ciudad, puedes elegir moverte hacia la segunda\n"),
		write("ciudad, donde podras encontrar el primer gym, como es el gym numero 1, solo necesitas ganar\n"),
		write("una sola batalla para obtener tu primera medalla\n\n\n").

menu:-imprimirMapa,estatus,write("\nQue deseas hacer?\n"),
		write("(1)\tir al Gym\n(2)\tir a la Tienda\n(3)\tir a la Enfermeria"),muestraCaminosDisponibles,
		write("\nSu respuesta: "),read(X),
		(
			(X=1,gym);
			(X=2,tienda);
			(X=3,enfermeria);
			(X>3,X<8,entreCiudad(X))
		).

% - - - CODIGO PARA ELEGIR PRIMER POKEMON - - -
elegirPoke(X):-	random(1,3,Y),
					((X=1,pokemones(Nombre,Tip,Poder,X,Y),agregarPokemon([[Nombre,Tip,Poder,full,0]]));
					 (X=2,pokemones(Nombre,Tip,Poder,X,Y),agregarPokemon([[Nombre,Tip,Poder,full,0]]));
					 (X=3,pokemones(Nombre,Tip,Poder,X,Y),agregarPokemon([[Nombre,Tip,Poder,full,0]]));
					 (X=4,pokemones(Nombre,Tip,Poder,X,Y),agregarPokemon([[Nombre,Tip,Poder,full,0]]));
					 (X=5,pokemones(Nombre,Tip,Poder,X,Y),agregarPokemon([[Nombre,Tip,Poder,full,0]]))
					).
elegirPoke(Tipo):-Tipo<1;Tipo>5,write("Porfavor, Ingresa un numero valido(1-5): "),read(X),elegirPoke(X).
% - - - FIN DE CODIGO PARA ELEGIR POKEMON - - -

% - - - CODIGO PARA GYM - - -
gym:-
	estatus(_,_,_,Num,_), write("\nEstas en el gym numero "), write(Num),
	write("\n(1)\tLuchar\n(2)\tSalir\nQue deceas hacer: "), read(Des), decision(Des), gym.

decision(Des):-
			(	
				Des=1, pokeRandom(Poke), elegirPeleador(Luchador),
				elementoN(Luchador,1,NombreLuchdor),elementoN(Poke,1,NombrePoke),
				write("\n\t\t"),write(NombreLuchdor),write(" VS "),write(NombrePoke),
				pelear(Luchador,Poke,1,3)
			);
			(
				Des=2,write("\nSaliendo...\n\n"),menu
			);
			(
				Des<1;Des>2,write("\nEscribe una opcion valida: "),read(Des2),decision(Des2)
			).
% - - - FIN CODIGO GYM - - -

% - - - CODIGO PARA LA TIENDA - - -
tienda:-
		write("Bienvenido a la tienda, su dinero actual es de "),pokemochila(_,_,Din,_),write(Din),
		write(".\nlas pokebolas que tenemos disponibles, y sus costos son los siguientes\n\n"),
		pokebolas(Lista), muestraPokeballs(Lista,1),
		write("\n\nIngrese el numero de la pokebola que desea comprar(1-4), o 0 si desea salir: "),
		read(Resp),comprarPokebola(Resp).

muestraPokeballs([],_).
muestraPokeballs( [ [Nombre,Costo] |H] , Indice):-	
						write("("),write(Indice),write(")\t"),
						write(Nombre),write("\tcosto: "),write(Costo),write("\n"),
						Indice2 is Indice+1, muestraPokeballs(H,Indice2).

comprarPokebola(X):-pokebolas(Lista), elementoN(Lista,X,Pokebola), Pokebola=[_,Costo], quitarDinero(Costo,X).
comprarPokebola(X):- X<0;X>4,write("Porfavor, Ingresa un numero valido(1-4), o 0 para salir: "),read(Y),comprarPokebola(Y).
comprarPokebola(0).

quitarDinero(X,Posicion):- 
				pokemochila(Pokemones,Pokebolas,Dinero,Medallas),
				Dinero>=X,
				NewDinero is Dinero-X, NewListPokebolas=[0],
				retract(pokemochila(Pokemones,Pokebolas,Dinero,Medallas)),
				assertz(pokemochila(Pokemones,Pokebolas,NewDinero,Medallas)),
				estatus(X1,X2,Din,X3,X4),
				retract(estatus(X1,X2,Din,X3,X4)),
				assertz(estatus(X1,X2,NewDinero,X3,X4)),
				agregarPokebola(NewListPokebolas,Pokebolas,Posicion,1),
				write("Transaccion completada con exito\n").

quitarDinero(X,_):-
				pokemochila(_,_,Dinero,_), Dinero<X,
				write("\nNo cuentas con el dinero suficiente para comprar la pokebola que deseas\n\n").
% - - - FIN CODIGO TIENDA - - - 

% - - - CODIGO PARA LA ENFERMERIA - - -
enfermeria:-write("\n(1)\tCurar Pokemones\n(2)\tSalir\nQue decides: "),read(Des),
			(
				(Des=1,curarPokemones,menu);
				(Des=2,write("Saliendo..."),menu);
				(Des<1;Des>2,write("\nEscribe una opcion valida\n"),enfermeria)
			).

curarPokemones:-pokemochila(Pokemones,_,_,_), NewPokemones=[0], curar(Pokemones,NewPokemones).

curar([],NewPokemones):-
				NewPokemones=[_|PokesSanos],
				pokemochila(Pokemones,P,D,M),
				retract(pokemochila(Pokemones,P,D,M)),
				assertz(pokemochila(PokesSanos,P,D,M)).

curar(Pokemones,NewPokemones):-
				Pokemones=[Poke|H], Poke=[Nombre,Tipo,_,_,Experiencia],
				(
					(
					 pokemones(Nombre,_,FullPoder,_,_), NewPoke=[Nombre,Tipo,FullPoder,full,Experiencia],
					 append(NewPokemones,[NewPoke],NewPokemones2)
					);
				    (
					  evoluciones(Nombre1,[Nombre,_,P1],_),
					  pokemones(Nombre1,_,P2,_,_),
					  FullPoder is P1+P2,
					  NewPoke=[Nombre,Tipo,FullPoder,full,Experiencia],
					  append(NewPokemones,[NewPoke],NewPokemones2)
					);
					(
					  evoluciones(Nombre1,[Nombre2,_,P1],[Nombre2,_,P3]),
					  pokemones(Nombre1,_,P2,_,_),
					  FullPoder is P1+P2+P3,
					  NewPoke=[Nombre,Tipo,FullPoder,full,Experiencia],
					  append(NewPokemones,[NewPoke],NewPokemones2)
					)
				),
				curar(H,NewPokemones2).
% - - - FIN CODIGO ENFERMERIA - - - 

% - - - CODIGO PARA MOVERSE ENTRE CIUDADES - - -
entreCiudad(X):-random(1,4,Y),
				(	 (Y=1,moverse(X),pokeRandom(Poke),pokemonSalvaje(Poke),menu);
					 (Y=2,entrenadorSalvaje,moverse(X),menu);
					 (Y=3,huevoSalvaje,moverse(X),menu);
					 (Y=4,write("Has encontrado una pokebola!!!"),pokemochila(_,P,_,_),agregarPokebola([0],P,1,1),moverse(X),menu)
				).

pokemonSalvaje(Poke):-write("\nTe has encontrado con un pokemon salvaje.\n"),
					Poke=[Nombre,Tipo,Poder], write("Pokemon: "),write(Nombre),
					write("\tTipo: "),write(Tipo),write("\tPoder: "),write(Poder),
					write("\nEs tu decision si peleas, lo atrapas o ignoras\n"),
					write("(1)\tPelear\n(2)\tAtraparlo\n(3)\tIgnorarlo\nDecision: "),
					read(Des),write("\n"),decision2(Des,Poke).

decision2(Des,Poke):-
				(	
					Des=1,
					elegirPeleador(Luchador),elementoN(Luchador,1,L),elementoN(Poke,1,P),
					write("\n\t\t"),write(L),write(" VS "),write(P),pelear(Luchador,Poke,1,1)
				);
				(Des=2, atraparPoke(Poke));
				(Des=3,write("\nHas decidido Ignorar, continuaras el trayecto a la siguiente ciudad...\n\n"));
				(Des<1;Des>3,write("\nEscribe una opcion valida: "),read(Des2),decision2(Des2,Poke)).

atraparPoke(Poke):-
		muestraPokebolas, write("Cual deceas usar: "), read(Des), pokemochila(_,P,_,_),
		(
			(
				quitarPokebola([0],P,Des,1), random(Des,4,X),
				(
					(
						X=Des, Poke=[Nombre|_], pokemones(Nombre,Tipo,Poder,_,_), 
						Pokemon=[Nombre,Tipo,Poder,full,0], agregarPokemon([Pokemon]),
						write("\nLo has capturado\n")
					);
					(
						X\=Des, write("\nNo lograste atraparlo\n"),pokemonSalvaje(Poke)
					)
				)
			);
			(
				Des=4, quitarPokebola([0],P,Des,1),
				Poke=[Nombre|_], pokemones(Nombre,Tipo,Poder,_,_), 
				Pokemon=[Nombre,Tipo,Poder,full,0], agregarPokemon([Pokemon]),
				write("\nLo has capturado\n")
			)
		).

muestraPokebolas:-pokemochila(_,Pokebolas,_,_),imprimePokebolas(Pokebolas,1).

imprimePokebolas([],_).
imprimePokebolas( [ [Nombre,Cantidad] |H] , Indice):-	
						write("("),write(Indice),write(")\t"),
						write(Nombre),write("\tcantidad: "),write(Cantidad),write("\n"),
						Indice2 is Indice+1, imprimePokebolas(H,Indice2).

entrenadorSalvaje:-write("Has encontrado un entrenador, es tu decision si lo enfrentas.\n"),
					write("(1)\tPelear\n(2)\tIgnorarlo\nDecision: "),read(Des),decision3(Des).

decision3(Des):-(	Des=1,pokeRandom(Poke),
					elegirPeleador(Luchador),elementoN(Luchador,1,L),elementoN(Poke,1,P),
					write("\n\t\t"),write(L),write(" VS "),write(P),pelear(Luchador,Poke,1,2)
				);
				(Des=2,write("\nHas decidido Ignorar, continuaras el trayecto a la siguiente ciudad...\n\n"));
				(Des<1;Des>2,write("\nEscribe una opcion valida: "),read(Des2),decision3(Des2)).

huevoSalvaje:-write("Has encontrado un huevo").
% - - - FIN DE CODIGO PARA MOVERSE ENTRE CIUDADES - - -

% - - - CODIGO PARA ELEGIR CON QUE POKE PELEAR - - -
pokeRandom(Poke):-random(1,5,X),random(1,3,Y),pokemones(Nom,Tipo,Poder,X,Y),Poke=[Nom,Tipo,Poder].

elegirPeleador(Poke):- pokemochila(X,_,_,_),write("\nNombre-Tipo-Poder-Estado-Experiencia\n"),mostrarPokes(X,1),
				write("Elige el pokemon con el que pelearas: "),read(Res),eleccion(Res,Poke).

mostrarPokes([],_).
mostrarPokes(Pokes,X):-Pokes=[P|H],write("("),write(X),write(")\t"),write(P),write("\n"),X1 is X+1,mostrarPokes(H,X1).

eleccion(Res,Poke):- pokemochila(Lista,_,_,_),elementoN(Lista,Res,Poke),quitarPokemon(Poke).
% - - - FIN DE CODIGO PARA ELEGIR CON QUE POKE PELEAR - - -

% - - - CODIGO PARA LAS PELEAS - - -
pelear(Luchador,Poke,5,Tipo):-peleaFinalizada(Luchador,Poke,Tipo).
pelear(Luchador,Poke,X,Tipo):- write("\n\nRound "),write(X),
							elementoN(Luchador,3,L),elementoN(Poke,3,P),elementoN(Luchador,1,NomL),elementoN(Poke,1,NomP),
							write("\t\tNiveles de Poder--> Tu: "),write(L),write(", Contrincante: "), write(P),write("\n\n"),
							ataques(NomL,ListaL),ataques(NomP,ListaP),muestraAtaques(ListaL,1),write("Cual deseas usar?: "),
							read(Resp),elementoN(ListaL,Resp,[_|[Disminucion]]),P2 is P-Disminucion,
							(
								(	P2>0,
									random(1,4,Resp2),
									elementoN(ListaP,Resp2,[_|[Disminucion2]]),
									L2 is L-Disminucion2,
									(
										(
											L2<1,
											sustituir(L,0,Luchador,Luchador2),
											peleaFinalizada(Luchador2,Poke,Tipo)
										);
										(
											L2>0,
											X2 is X+1,
											sustituir(L,L2,Luchador,Luchador2),
											sustituir(P,P2,Poke,Poke2),
											pelear(Luchador2,Poke2,X2,Tipo)
										)
									)
								);
								(
									P2<1,
									sustituir(P,0,Poke,Poke2),
									peleaFinalizada(Luchador,Poke2,Tipo)
								)
							).

muestraAtaques([],_).
muestraAtaques([[X|[Y]]|H],Z):-	write("("),write(Z),write(")\t"),write("Resta "),write(Y),write(" puntos al enemigo-->\t"),
								write(X),write("\n"),Z1 is Z+1,muestraAtaques(H,Z1).
% - - - FIN DEL CODIGO PARA LAS PELEAS - - -

% - - - CODIGO PARA CUANDO FINALIZA UNA PELEA CONTRA POKEMON SALVAJE - - -
peleaFinalizada(Luchador,Poke,1):- 
		write("\n\nSe termino la pelea\n"),
		elementoN(Luchador,3,L),elementoN(Luchador,4,E),elementoN(Poke,3,P),
		(
			%[nombre,tipo,poder,estado,experiencia]
			(L<1,sustituir(E,muerto,Luchador,Luchador2));
			(L>0,sustituir(E,debilitado,Luchador,Luchador2))
		),
		(
			(
				L>P,write("El ganador eres tu\n"),agregarExperiencia(Luchador2,Luch3),
				write("\nComo ganaste, decides si capturas al pokemon o lo dejas libre\n"),
				write("(1)\tCapturarlo\n(2)\tDejarlo ir\nQue decides: "),read(Des),
				(
					(
						Des=1,Poke=[Nombre|_],pokemones(Nombre,Tipo,Poder,_,_),
						Pokemon=[Nombre,Tipo,Poder,full,0],agregarPokemon([Pokemon]),
						pokemochila(_,P,_,_), quitarPokebola([0],P,1,1),
						write("\nLo has capturado\n")
					);
					(write("\nLo has dejado en libertad...\n"))
				)
			);
			(P>L,write("Lamentablemete perdiste, deberias llevar tu pokemon a la enfermeria\n"),Luch3 = Luchador2);
			(P=L,write("Fue un Empate\n"),Luch3 = Luchador2)
				
		),
		agregarPokemon([Luch3]).

% - - - CODIGO PARA CUANDO FINALIZA UNA PELEA CONTRA ENTRENADOR SALVAJE - - -
peleaFinalizada(Luchador,Poke,2):- 
		write("\n\nSe termino la pelea\n"),
		elementoN(Luchador,3,L),elementoN(Luchador,4,E),elementoN(Poke,3,P),random(100,250,Ran),
		(
			%[nombre,tipo,poder,estado,experiencia]
			(L<1,sustituir(E,muerto,Luchador,Luchador2));
			(L>0,sustituir(E,debilitado,Luchador,Luchador2))
		),
		(
			(L>P,write("El ganador eres tu\n"),agregarDinero(Ran),agregarExperiencia(Luchador2,Luch3));
			(P>L,write("Lamentablemete perdiste, deberias llevar tu pokemon a la enfermeria\n"),Luch3 = Luchador2);
			(P=L,write("Fue un Empate\n"),Luch3 = Luchador2)
		),
		agregarPokemon([Luch3]).

% - - - CODIGO PARA CUANDO FINALIZA UNA PELEA CONTRA ENTRENADOR EN GYM - - -
peleaFinalizada(Luchador,Poke,3):-
		write("\n\nSe termino la pelea\n"),
		elementoN(Luchador,3,L),elementoN(Luchador,4,E),elementoN(Poke,3,P),random(100,250,Ran),
		(
			%[nombre,tipo,poder,estado,experiencia]
			(L<1,sustituir(E,muerto,Luchador,Luchador2));
			(L>0,sustituir(E,debilitado,Luchador,Luchador2))
		),
		(
			(L>P,write("El ganador eres tu\n"),agregarDinero(Ran),agregarExperiencia(Luchador2,Luch3),victoria,agregarPokemon([Luch3]));
			(P>L,write("Lamentablemete perdiste, deberias llevar tu pokemon a la enfermeria\n"),agregarPokemon([Luchador2]),todosMueren);
			(P=L,write("Fue un Empate\n"),agregarPokemon([Luchador2]))
		).

% - - - CODIGO PARA LAS VICTORIAS EN LOS GYM - - -
gimnasios([[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]]).

victoria:-estatus(_,_,_,CA,_),gimnasios(L),NewL=[0],agregarVictoria(NewL,L,CA,0),medalla(CA).

agregarVictoria(NewL,_,_,7):-gimnasios(A),NewL=[_|H],retract(gimnasios(A)),assertz(gimnasios(H)).
agregarVictoria(NewL,L,X,X):-	L=[T|H],T=[Gym,Victorias],NewVic is Victorias+1,append(NewL,[[Gym,NewVic]],NewL2),
								X2 is X+1,agregarVictoria(NewL2,H,X,X2).
agregarVictoria(NewL,L,Posicion,X):-Posicion\=X,L=[T|H],append(NewL,[T],NewL2),X2 is X+1,
								agregarVictoria(NewL2,H,Posicion,X2).
% - - - FIN DEL CODIGO PARA LAS VICTORIAS EN LOS GYM - - -

% - - - CODIGO PARA CONTROLAR LAS MEDALLAS - - -
medallas([med1,med2,med3,med4,med5,med6]).

medalla(1):-gimnasios(L),elementoN(L,2,[1,Victorias]),Victorias=1,agregarMedalla.
medalla(2):-gimnasios(L),elementoN(L,3,[2,Victorias]),Victorias=2,agregarMedalla.
medalla(3):-gimnasios(L),elementoN(L,4,[3,Victorias]),Victorias=3,agregarMedalla.
medalla(4):-gimnasios(L),elementoN(L,5,[4,Victorias]),Victorias=4,agregarMedalla.
medalla(5):-gimnasios(L),elementoN(L,6,[5,Victorias]),Victorias=5,agregarMedalla.
medalla(6):-gimnasios(L),elementoN(L,7,[6,Victorias]),Victorias=6,agregarMedalla.
medalla(_):-write("\n").

agregarMedalla:-pokemochila(A,B,C,Medallas),estatus(D,E,F,CA,G),medallas(L),
				elementoN(L,CA,Medalla),append(Medallas,[Medalla],NewMedallas),
				retract(pokemochila(A,B,C,Medallas)),assertz(pokemochila(A,B,C,NewMedallas)),
				G1 is G+1,retract(estatus(D,E,F,CA,G)),assertz(estatus(D,E,F,CA,G1)),
				write("\nFelicidades has obtenido la medalla del Gym "),write(CA),write("\n"),seisMedallas(G1).

seisMedallas(6):-write("\nFelicidades, has consegido las 6 medallas, has completado el juego"),!.
seisMedallas(_):-write("\n").
% - - - FIN DE CODIGO PARA CONTROLAR MEDALLAS - - -

% - - - CODIGO PARA CONTROLAR LA EXPERIENCIA Y EVOLUCION DE LOS POOKES - - -
agregarExperiencia(Poke,NewPoke):-elementoN(Poke,5,Exp), NewExp is Exp+20,
									(
										(NewExp=100,evolucion(Poke,NewPoke,100));
										(NewExp=300,evolucion(Poke,NewPoke,300));
										(NewExp\=100,NewExp\=300,sustituir(Exp,NewExp,Poke,NewPoke))
									).

evolucion(Poke,NewPoke,100):-elementoN(Poke,1,Nombre1),evoluciones(Nombre1,[Nombre2,_,Poder2],_),
							pokemones(Nombre1,Tipo,Poder1,_,_), NewPoder is Poder1+Poder2,
							NewPoke=[Nombre2,Tipo,NewPoder,full,100],
							write("Felicidades, tu pokemon "),write(Nombre1),write(" a evolucionado!!!!\n"),
							write("Su nuevo nombre es "),write(Nombre2),write(", y tiene un poder de "),write(NewPoder).
evolucion(Poke,NewPoke,300):-elementoN(Poke,1,Nombre2),evoluciones(Nombre1,[Nombre2,_,Poder2],[Nombre3,_,Poder3]),
							pokemones(Nombre1,Tipo,Poder1,_,_),NewPoder is Poder1+Poder2+Poder3,
							NewPoke=[Nombre3,Tipo,NewPoder,full,300],
							write("Felicidades, tu pokemon "),write(Nombre2),write(" a evolucionado!!!!\n"),
							write("Su nuevo nombre es "),write(Nombre3),write(", y tiene un poder de "),write(NewPoder).
% - - - FIN DEL  CODIGO PARA CONTROLAR LA EXPERIENCIA Y EVOLUCION DE LOS POOKES - - -

% - - - CODIGO PARA VALIDAR SI LOS POKES MURIERON - - -
todosMueren:-pokemochila(Pokemones,_,_,_),recorre(Pokemones,Result),write(Result).

recorre([],Result):-Result is 1.
recorre(Pokemones,Result):-Pokemones=[Poke|_],Poke=[_,_,Estado,_],Estado\=muerto,Result is 2.
recorre(Pokemones,Result):-Pokemones=[Poke|H],Poke=[_,_,muerto,_],recorre(H,Result).
% - - - CODIGO PARA VALIDAR SI LOS POKES MURIERON - - -

% - - - CODIGO PARA CAMBIAR DE CIUDAD - - -
muestraCaminosDisponibles:-estatus(_,_,_,CA,_),mapa(Mapa),imprimeCaminos(Mapa,CA,4).
imprimeCaminos([],_,_):-write("\n").
imprimeCaminos(Mapa,CA,X):-Mapa=[H|NewMapa],
						(
							(H=[CA,Direccion,_,_],
								write("\n("),write(X),write(")\tIr al "),write(Direccion),
								X1 is X+1,imprimeCaminos(NewMapa,CA,X1)
							);
							(imprimeCaminos(NewMapa,CA,X))
						).

moverse(Y):-mapa(Mapa), estatus(_,_,_,CA,_), caminos(Mapa,CA,4,Y).

caminos(Mapa,CA,X,Y):-
				Mapa=[H|NewMapa],
				(
					(
						H=[CA,_,NewCiudad,_],
						X=Y, estatus(A,B,C,CA,D),
						retract(estatus(A,B,C,CA,D)),
						assertz(estatus(A,B,C,NewCiudad,D))
					);
					(
						H=[CA,_,_,_],
						X1 is X+1,
						caminos(NewMapa,CA,X1,Y)
					);
					(
						caminos(NewMapa,CA,X,Y)
					)
				).
% - - - FIN DE CODIGO PARA CAMBIAR DE CIUDAD - - -

% - - - PREDICADOS NECESARIOS PARA LA FUNCIONALIDAD DEL JUEGO - - -
agregarDinero(X):- 
				pokemochila(A,B,Dinero,C),
				NewDinero is Dinero+X,
				retract(pokemochila(A,B,Dinero,C)),
				assertz(pokemochila(A,B,NewDinero,C)),
				estatus(E,F,Din,H,I),
				retract(estatus(E,F,Din,H,I)),
				assertz(estatus(E,F,NewDinero,H,I)).

agregarPokemon(NewPoke):- 
				pokemochila(Pokemones,B,D,C),
				append(Pokemones, NewPoke, NewList),
				retract(pokemochila(Pokemones,B,D,C)),
				assertz(pokemochila(NewList,B,D,C)),
				estatus(E,Cantidad,G,H,I), C2 is Cantidad+1,
				retract(estatus(E,Cantidad,G,H,I)),
				assertz(estatus(E,C2,G,H,I)).

quitarPokemon(Poke):-
				pokemochila(Pokemones,B,D,C),
				remover(Poke, Pokemones, NewList),
				retract(pokemochila(Pokemones,B,D,C)),
				assertz(pokemochila(NewList,B,D,C)),
				estatus(E,Cantidad,G,H,I), C2 is Cantidad-1,
				retract(estatus(E,Cantidad,G,H,I)),
				assertz(estatus(E,C2,G,H,I)).

agregarPokebola(NewList,List,Posicion,X):-
							Posicion\=X, List=[T|H],
							append(NewList,[T],NewL2), X2 is X+1,
							agregarPokebola(NewL2,H,Posicion,X2).

agregarPokebola(NewList,List,Posicion,X):-
							Posicion=X,	
							List=[T|H], T=[Pokebola,Cantidad],
							C2 is Cantidad+1, append(NewList,[[Pokebola,C2]],NewL2),
							X2 is X+1, agregarPokebola(NewL2,H,Posicion,X2).

agregarPokebola(NewListPokebolas,_,_,5):-
							pokemochila(A,Pokebolas,D,C), 
							NewListPokebolas=[_|H],
							retract(pokemochila(A,Pokebolas,D,C)),
							assertz(pokemochila(A,H,D,C)).

quitarPokebola(NewList,List,Posicion,X):-
							Posicion\=X, List=[T|H],
							append(NewList,[T],NewL2), X2 is X+1,
							agregarPokebola(NewL2,H,Posicion,X2).

quitarPokebola(NewList,List,Posicion,X):-
							Posicion=X,	
							List=[T|H], T=[Pokebola,Cantidad],
							C2 is Cantidad-1, append(NewList,[[Pokebola,C2]],NewL2),
							X2 is X+1, agregarPokebola(NewL2,H,Posicion,X2).

quitarPokebola(NewListPokebolas,_,_,5):-
							pokemochila(A,Pokebolas,D,C), 
							NewListPokebolas=[_|H],
							retract(pokemochila(A,Pokebolas,D,C)),
							assertz(pokemochila(A,H,D,C)).

estatus:-write("\n--Estatus--\n"),estatus(Nombre,Pokemones,Dinero,Ciudad,Medallas),
		write("Nombre: "),write(Nombre),write(",\t"),write("Cantidad de Pokemones en Mochila: "),write(Pokemones),write(",\n"),
		write("Dinero: "),write(Dinero),write(",\t")	,write("Ciudad Actual: "),write(Ciudad),write(",\t"),write("Medallas: "),write(Medallas),write("\n").

% - - - CODIGO PARA MANIPULACION DE LISTAS - - -
sustituir(_,_,[],[]).
sustituir(X,Y,[X|T],[Y|S]):-!,sustituir(X,Y,T,S).
sustituir(X,Y,[Z|T],[Z|S]):-sustituir(X,Y,T,S).

remover(X, [X|Xs], Xs).
remover(X, [Y|Ys], [Y|Zs]):- remover(X, Ys, Zs).

elementoN([Y|_], 1, Y).
elementoN([_|Xs], N, Y):-N2 is N - 1,elementoN(Xs, N2, Y).
% - - - FIN DEL CODIGO PARA MANIPULACION DE LISTAS - - -

% - - - MAPA - - - 
imprimirMapa:- write("
                                ----MAPA----
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #
# . . . ___________ . . . . . . . . . .___________. . . . . . . . . . . . . . #
# . . .|           |. . . . . . . . . |           | . . . . . . . . N . . . . #
# . . .|  Ciudad   |_ _ _ _ _ _ _ _ _ | Ciudad 1  | . . . . . . .   |   . . . #
# . . .|  Inicio    _ _ _ _ _ _ _ _ _     Gym 1   | . . . . . . O --*-- E . . #
# . . .|___________|. . . . . . . . . |_   _______| . . . . . . .   |   . . . #
# . . . . . . . . . . . . . . . . . . . | | . . . . . . . . . . . . S . . . . #
# . . . . . . . . . . . . . . . . . . . | | . . . . . . . . . . . . . . . . . #
# . . . . . . . . . . . . . . . . . . . | | . . . . . . . . . . . . . . . . . #
# . . . . . . . . . . . . . . . . . . ._| |_______. . . . . . . . . . . . . . #
# . . . . . .___________. . . . . . . |           | . . . . . . . . . . . . . #
# . . . . . |           | _ _ _ _ _ _ | Ciudad 2  | . . . . . . . . . . . . . #
# . . . . . | Ciudad 3      _ _ _ _ _ _   Gym 2   | . . . . . . . . . . . . . #
# . . . . . |   Gym 3   | . . . . . . |___   _____| . . . . . . . . . . . . . #
# . . . . . |___   _____| . . . . . . . . | | . . . . . . . . . . . . . . . . #
# . . . . . . . | | . . . . . . . . . . . | | . . . . . . . . . . . . . . . . #
# . . . . . . . | | . . . . . . . . . . . | | . . . . . . . . . . . . . . . . #
# . . . . . . . | | . . . . . . . . . . . | | . . . . . . . . . . . . . . . . #
# . . . . . . . | | . . . . . . . . . . . | | . . . . . . . . . . . . . . . . #
# . . . . . . . | | . . . . . . . . . .___| |_____. . . . . . . . . . . . . . #
# . . . . . .___| |_____. . . . . . . |           | . . . . . . . . . . . . . #
# . . . . . |           |_ _ _ _ _ _ _| Ciudad 5  | . . . . .___________. . . #
# . . . . . | Ciudad 4   _ _ _ _ _ _ _    Gym 5   |_ _ _ _ _|           | . . #
# . . . . . |   Gym 4   | . . . . . . |___________ _ _ _ _ _  Ciudad 6  | . . #
# . . . . . |___________| . . . . . . . . . . . . . . . . . |   Gym 6   | . . #
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |___________| . . #
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #\n").
