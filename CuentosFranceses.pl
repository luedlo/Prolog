%  Base de conocimiento:   Diccionario espanol-frances	
trad('ciudad,' , 'ville,').			trad('conocer' , 'connaître').
trad('las' , 'les').				trad('No me gustan' , 'Je n´aime pas').
trad('vacaciones' , 'vacances').	trad('Antes de' , 'Avant de').	
trad('acento' , 'accent').			trad('me' , 'il me').
trad('yo' , 'je').					trad('prefiero' , 'préfère').
trad('visitar' , 'visite').			trad('relajantes,' , 'détentes,').
trad('lugares' , 'lieux').			trad('historicos' , 'historiques').
trad('y' , 'et').					trad('caminar' , 'marcher').
trad('parece' , 'semble').			trad('idioma' , 'langue').
trad('simple' , 'simple').			trad('de' , 'á').
trad('calles' , 'rues'). 			trad('pequenas.' , 'petits.').
trad('por' , 'pour').				trad('una' , 'une').
trad('estaba' , 'j´étais').			trad('interesada' , 'intéressé').
trad('aprender' , 'apprendre').		trad('italiano.' , 'l´italien.').
trad('Porque' , 'Parce que').		trad('me gusta' , 'j´aime').
trad('mucho' , 'beaucoup').			trad('su' , 'son').
trad('comenzar' , 'commencer').		trad('estudiar' , 'étudier').
trad('el' , 'le').					trad('frances,' , 'français').
trad('a' , 'á').					trad('un' , 'une').

% Base de conocimiento:   Cuentos 
cuentos(uno, ['No me gustan', 'las', 'vacaciones', 'relajantes,' ,'yo','prefiero',
	'visitar','una','ciudad,' , 'conocer','lugares','historicos','y','caminar','por',
	'las','calles','pequenas.' ]).	
	
cuentos(dos, ['Antes de', 'comenzar', 'a', 'estudiar', 'frances,', 'estaba', 
	'interesada', 'por', 'aprender', 'italiano.', 'Porque', 'me gusta', 'mucho', 
	'su', 'acento', 'y', 'me', 'parece', 'un', 'idioma', 'simple', 'de', 'aprender' ]).
	

type(X, T) :- cuentos(X,L) , translate(L,Ans) , show(Ans).
translate([H|T], [H1|T1]) :- trad(H,H1) , translate(T, T1). 
show([H|T]) :- write(H) , tab(1) , show(T).
	
	