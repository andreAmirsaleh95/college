% fam1:
male(father1).
female(mother1).
male(son1).
female(daughter1).
parent(father1, son1).
parent(father1, daughter1).
parent(mother1, son1).
parent(mother1, daughter1).
parent(gPa, mother1).
parent(gMa, mother1).

% fam2:
male(father2).
female(mother2).
male(son2).
parent(father2, son2).
parent(mother2, son2).

father(Father, Child) :-
	parent(Father, Child),
	male(Father).

mother(Mother, Child) :-
	parent(Mother, Child),
	female(Mother).

son(Son, Parent) :-
	parent(Parent, Son),
	male(Son).

daughter(Daughter, Parent) :-
	parent(Parent, Daughter),
	female(Daughter).

grandparent(Grandparent, GrandChild) :-
	parent(Grandparent, Child),
	parent(Child, GrandChild).

sibling(Sibling1, Sibling2) :-
	parent(Parent1, Sibling1),
	parent(Parent2, Sibling2),
	Parent1 = Parent2.

aunt(Aunt, nieceOrNeph) :-
	sibling(Aunt, Sibling),
	parent(Sibling, nieceOrNeph),
	female(Aunt).

uncle(Uncle, nieceOrNeph) :-
	sibling(Uncle, Sibling),
	parent(Sibling, nieceOrNeph),
	male(Uncle).

cousin(Cousin1, Cousin2) :-
	parent(Cousin1, Parent1),
	parent(Cousin2, Parent2),
	Parent1 = Parent2.