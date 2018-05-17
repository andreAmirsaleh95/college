mem(X, [H|T]) :-
	X = H;
	mem(X, T).