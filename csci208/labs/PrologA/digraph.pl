edge(a, b).
edge(b, c).
edge(c, d).
edge(c, e).
edge(e, d).
edge(f, e).
edge(f, c).
edge(f, g).
edge(g, c).

path(Node1, Node2) :-
	edge(Node1, Node2);
	Node1 = Node2.
path(Node1, Node2) :-
	edge(Node1, SomeNode),
	path(SomeNode, Node2).

path2(Node1, Node2) :-
	edge(Node1, SomeNode),
	edge(SomeNode, Node2).

path3(Node1, Node2) :-
	path2(Node1, Node2).

path3Wrong(Node1, Node2) :-
	edge(Node1, SomeNode1),
	edge(SomeNode1, SomeNode2),
	edge(SomeNode2, Node2).