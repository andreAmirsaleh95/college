% Name: Andre Amirsaleh
% Course: CSCI 208L - Programming Language Design Lab (1:00PM section)

check(a, int).
check(b, double).
check(c, int).
check(add, [int,int,int]).
check(add, [double,double,double]).
check(add, [string,string,string]).
check(bar, [double, int]).

checkprint(X, Y):-
	check(X, Y),
	write('CHECK '),
	write(X),
	write(' is '),
	write(Y),
	write('\n').

coerce_base(int, double).
coerce_base(double, string).

coerce(X, Y) :-
	coerce_base(X, Y).
coerce(X, Z) :-
	coerce_base(X, Y),
	coerce(Y, Z).

coerceprint(X, Y) :-
	write('COERCE '),
	write(X),
	write(' to '),
	write(Y),
	write('\n'),
	coerce(X, Y).

equiv(T1, T2):-
	write('EQUIV '),
	write(T1),
	write(', '),
	write(T2),
	write('\n'),
	T1 = T2.
equiv(T1, T2):-
	not(T1=T2),
	coerceprint(T1, T2).

infer(X, T):-
	checkprint(X, T).
infer(apply_1(F, X), T) :-
	infer(X, TX),
	infer(F, TF),
	TF = [TARG, TRETURN],
	equiv(TX, TARG),
	write(TRETURN),
	write('\n'),
	write(T),
	write('\n'),
	TRETURN = T,
	write('INFER '),
	write(apply_1(F, X)),
	write(' is '),
	write(T),
	write('\n').
infer(apply_2(F,X,Y), T) :-
	infer(X, TX),
	infer(Y, TY),
	infer(F, TF),
	TF = [TARG, TARGY, TRETURN],
	equiv(TX, TARG),
	equiv(TY, TARGY),
	TRETURN = T,
	write('INFER '),
	write(apply_2(F, X, Y)),
	write(' is '),
	write(T),
	write('\n').

typecheck(assign(X, Y)) :-
	infer(X, Z),	
	infer(Y, Z).