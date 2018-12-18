typeN(['1','2','3','4','5','6','7','8','9','0','+2','R','Can']).
typeE(['+4'],['Com']).

/* Cards List */
cards(List).

/* Assign card type */
assign(List, 0).
assign(List, CardsNum) :-

/* Mix cards */
mix(List, CardsNum) :-

/* Cards in stack */
stack(List, 0).
stack(List, CardsNum) :-

/* Played cards */
played(List, CardsNum).

/* Describe players */
player(List).

/* Player Cards  */
playerCards(List).

/* Deal */
deal(List, CardsNum) :-

/* Start the game */
start(List) :-

/* Player1 would start the game */
game(List) :-

/* Next player */
next(List) :-

/* Steal cards in case of needed*/
steal(List, CardsNum).
steal(List, CardsNum) :- 

/* Put card */
put(List) :-

/* Say one! */
one(Player) :-

/* In case of +2 */
case1(Player1, Player2) :- 

/* In case of +4 */
case1(Player1, Player2) :- 

/* In case of Com */
case1(Player1, Player2) :- 

/* In case of R */
case1(Player1, Player2) :- 

/* In case of Can */
case1(Player1, Player2) :- 









