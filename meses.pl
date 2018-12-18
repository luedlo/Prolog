
month([january, february, march, april, may, june, july, august, september, october, november, december]).
month([1,2,3,4,5,6,7,8,9,10,11,12]).

lastMonth(1, _, 2).
lastMonth(12, 11, _).

lastMonth(Month, [H|T], Last, Next) :- Last is H ,
									   lastMonth(Month, T, Last, Next) ,
									   Next is T.
									