% Name: Andre Amirsaleh
% Course: CSCI 208L - Programming Language Design Lab (1:00PM section)

intree(leaf(X), V) :- X = V.
intree(node(T1,T2), V) :- intree(T1,V).
intree(node(T1,T2), V) :- intree(T2,V).


numberOfLeaves(leaf(T),N) :- N = 1.
numberOfLeaves(node(T1,T2), N) :-
	numberOfLeaves(T1, Left),
	numberOfLeaves(T2, Right),
	N is Left + Right.



% TEST:
%leaf(left).
%leaf(right).
%intree(leaf(left), 1).
%intree(leaf(right), 1).
%intree(node(root, ))
%intree(node)
%leaf(left).
%leaf(right).
%node(root).

%intree(node(root))

%node(andre, edwin).
%node(andre, emile).
%intree(andre, 2).


%node(andre, edwin).
%leaf(emile).
%node(andre, emile).
%intree(andre).

position(node(T1, T2), V, N) :-
	V is numberOfLeaves(node(T1, T2), N).

%position(T, V, N) :-
%	T is node(T1, T2),
%	position(node(T1, T2), V, N),

%	numberOfLeaves()
%	V is numberOfLeaves(T, N).
%

%position(node(node(leaf('a'),leaf('b')),leaf('a')), 'a', N).



position(node(T1, T2), V, N):-
	intree(T2, V),
	numberOfLeaves(T1, A),
	position(T2, V, B),
	N is A + B.
position(node(T1, T2), V, N):-
	intree(T1, V),
	position(T1,  V,  N).
position(leaf(T1), V, N):-
	T1 = V,
	N = 1.