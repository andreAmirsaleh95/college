% Name: Andre Amirsaleh
% Course: CSCI 208L - Programming Language Design Lab (1:00PM section)

color(red).
color(blue).
color(green).
color(yellow).
coloring([]).
coloring([H | T]) :-
	H = [A, B],
	color(A),
	color(B),
	A \= B,
	coloring(T).
/*
?-  coloring( [ [Switz, France], [Switz, Italy], [Switz, Germany], [Switz, Austria],
|    [Germany, France], [Germany, Austria], [France, Italy] ]).
Switz = red,
France = Austria, Austria = blue,
Italy = Germany, Germany = green ;
Switz = red,
France = blue,
Italy = Germany, Germany = green,
Austria = yellow ;
Switz = red,
France = Austria, Austria = blue,
Italy = green,
Germany = yellow ;
Switz = red,
France = blue,
Italy = Austria, Austria = green,
Germany = yellow ;
Switz = red,
France = Austria, Austria = blue,
Italy = yellow,
Germany = green ;
Switz = red,
France = blue,
Italy = Austria, Austria = yellow,
Germany = green ;
Switz = red,
France = Austria, Austria = blue,
Italy = Germany, Germany = yellow ;
Switz = red,
France = blue,
Italy = Germany, Germany = yellow,
Austria = green ;
Switz = red,
France = Austria, Austria = green,
Italy = Germany, Germany = blue ;
Switz = red,
France = green,
Italy = Germany, Germany = blue,
Austria = yellow ;
Switz = red,
France = green,
Italy = Austria, Austria = blue,
Germany = yellow ;
Switz = red,
France = Austria, Austria = green,
Italy = blue,
Germany = yellow ;
Switz = red,
France = Austria, Austria = green,
Italy = yellow,
Germany = blue ;
Switz = red,
France = green,
Italy = Austria, Austria = yellow,
Germany = blue ;
Switz = red,
France = green,
Italy = Germany, Germany = yellow,
Austria = blue ;
Switz = red,
France = Austria, Austria = green,
Italy = Germany, Germany = yellow ;
Switz = red,
France = yellow,
Italy = Germany, Germany = blue,
Austria = green ;
Switz = red,
France = Austria, Austria = yellow,
Italy = Germany, Germany = blue ;
Switz = red,
France = yellow,
Italy = Austria, Austria = blue,
Germany = green ;
Switz = red,
France = Austria, Austria = yellow,
Italy = blue,
Germany = green ;
Switz = red,
France = yellow,
Italy = Austria, Austria = green,
Germany = blue ;
Switz = red,
France = Austria, Austria = yellow,
Italy = green,
Germany = blue ;
Switz = red,
France = yellow,
Italy = Germany, Germany = green,
Austria = blue ;
Switz = red,
France = Austria, Austria = yellow,
Italy = Germany, Germany = green ;
Switz = blue,
France = Austria, Austria = red,
Italy = Germany, Germany = green ;
Switz = blue,
France = red,
Italy = Germany, Germany = green,
Austria = yellow ;
Switz = blue,
France = Austria, Austria = red,
Italy = green,
Germany = yellow ;
Switz = blue,
France = red,
Italy = Austria, Austria = green,
Germany = yellow ;
Switz = blue,
France = Austria, Austria = red,
Italy = yellow,
Germany = green ;
Switz = blue,
France = red,
Italy = Austria, Austria = yellow,
Germany = green ;
Switz = blue,
France = Austria, Austria = red,
Italy = Germany, Germany = yellow ;
Switz = blue,
France = red,
Italy = Germany, Germany = yellow,
Austria = green ;
Switz = blue,
France = Austria, Austria = green,
Italy = Germany, Germany = red ;
Switz = blue,
France = green,
Italy = Germany, Germany = red,
Austria = yellow ;
Switz = blue,
France = green,
Italy = Austria, Austria = red,
Germany = yellow ;
Switz = blue,
France = Austria, Austria = green,
Italy = red,
Germany = yellow ;
Switz = blue,
France = Austria, Austria = green,
Italy = yellow,
Germany = red ;
Switz = blue,
France = green,
Italy = Austria, Austria = yellow,
Germany = red ;
Switz = blue,
France = green,
Italy = Germany, Germany = yellow,
Austria = red ;
Switz = blue,
France = Austria, Austria = green,
Italy = Germany, Germany = yellow ;
Switz = blue,
France = yellow,
Italy = Germany, Germany = red,
Austria = green ;
Switz = blue,
France = Austria, Austria = yellow,
Italy = Germany, Germany = red ;
Switz = blue,
France = yellow,
Italy = Austria, Austria = red,
Germany = green ;
Switz = blue,
France = Austria, Austria = yellow,
Italy = red,
Germany = green ;
Switz = blue,
France = yellow,
Italy = Austria, Austria = green,
Germany = red ;
Switz = blue,
France = Austria, Austria = yellow,
Italy = green,
Germany = red ;
Switz = blue,
France = yellow,
Italy = Germany, Germany = green,
Austria = red ;
Switz = blue,
France = Austria, Austria = yellow,
Italy = Germany, Germany = green ;
Switz = green,
France = Austria, Austria = red,
Italy = Germany, Germany = blue ;
Switz = green,
France = red,
Italy = Germany, Germany = blue,
Austria = yellow ;
Switz = green,
France = Austria, Austria = red,
Italy = blue,
Germany = yellow ;
Switz = green,
France = red,
Italy = Austria, Austria = blue,
Germany = yellow ;
Switz = green,
France = Austria, Austria = red,
Italy = yellow,
Germany = blue ;
Switz = green,
France = red,
Italy = Austria, Austria = yellow,
Germany = blue ;
Switz = green,
France = Austria, Austria = red,
Italy = Germany, Germany = yellow ;
Switz = green,
France = red,
Italy = Germany, Germany = yellow,
Austria = blue ;
Switz = green,
France = Austria, Austria = blue,
Italy = Germany, Germany = red ;
Switz = green,
France = blue,
Italy = Germany, Germany = red,
Austria = yellow ;
Switz = green,
France = blue,
Italy = Austria, Austria = red,
Germany = yellow ;
Switz = green,
France = Austria, Austria = blue,
Italy = red,
Germany = yellow ;
Switz = green,
France = Austria, Austria = blue,
Italy = yellow,
Germany = red ;
Switz = green,
France = blue,
Italy = Austria, Austria = yellow,
Germany = red ;
Switz = green,
France = blue,
Italy = Germany, Germany = yellow,
Austria = red ;
Switz = green,
France = Austria, Austria = blue,
Italy = Germany, Germany = yellow ;
Switz = green,
France = yellow,
Italy = Germany, Germany = red,
Austria = blue ;
Switz = green,
France = Austria, Austria = yellow,
Italy = Germany, Germany = red ;
Switz = green,
France = yellow,
Italy = Austria, Austria = red,
Germany = blue ;
Switz = green,
France = Austria, Austria = yellow,
Italy = red,
Germany = blue ;
Switz = green,
France = yellow,
Italy = Austria, Austria = blue,
Germany = red ;
Switz = green,
France = Austria, Austria = yellow,
Italy = blue,
Germany = red ;
Switz = green,
France = yellow,
Italy = Germany, Germany = blue,
Austria = red ;
Switz = green,
France = Austria, Austria = yellow,
Italy = Germany, Germany = blue ;
Switz = yellow,
France = Austria, Austria = red,
Italy = Germany, Germany = blue ;
Switz = yellow,
France = red,
Italy = Germany, Germany = blue,
Austria = green ;
Switz = yellow,
France = Austria, Austria = red,
Italy = blue,
Germany = green ;
Switz = yellow,
France = red,
Italy = Austria, Austria = blue,
Germany = green ;
Switz = yellow,
France = Austria, Austria = red,
Italy = green,
Germany = blue ;
Switz = yellow,
France = red,
Italy = Austria, Austria = green,
Germany = blue ;
Switz = yellow,
France = Austria, Austria = red,
Italy = Germany, Germany = green ;
Switz = yellow,
France = red,
Italy = Germany, Germany = green,
Austria = blue ;
Switz = yellow,
France = Austria, Austria = blue,
Italy = Germany, Germany = red ;
Switz = yellow,
France = blue,
Italy = Germany, Germany = red,
Austria = green ;
Switz = yellow,
France = blue,
Italy = Austria, Austria = red,
Germany = green ;
Switz = yellow,
France = Austria, Austria = blue,
Italy = red,
Germany = green ;
Switz = yellow,
France = Austria, Austria = blue,
Italy = green,
Germany = red ;
Switz = yellow,
France = blue,
Italy = Austria, Austria = green,
Germany = red ;
Switz = yellow,
France = blue,
Italy = Germany, Germany = green,
Austria = red ;
Switz = yellow,
France = Austria, Austria = blue,
Italy = Germany, Germany = green ;
Switz = yellow,
France = green,
Italy = Germany, Germany = red,
Austria = blue ;
Switz = yellow,
France = Austria, Austria = green,
Italy = Germany, Germany = red ;
Switz = yellow,
France = green,
Italy = Austria, Austria = red,
Germany = blue ;
Switz = yellow,
France = Austria, Austria = green,
Italy = red,
Germany = blue ;
Switz = yellow,
France = green,
Italy = Austria, Austria = blue,
Germany = red ;
Switz = yellow,
France = Austria, Austria = green,
Italy = blue,
Germany = red ;
Switz = yellow,
France = green,
Italy = Germany, Germany = blue,
Austria = red ;
Switz = yellow,
France = Austria, Austria = green,
Italy = Germany, Germany = blue ;
false.

*/

/*
?- coloring( [ [Penn,Maryland], [Penn, Delaware], [Penn, NewJersey], [Penn, NewYork],
|    [Penn, Ohio], [Penn, WestVirginia], [Ohio, WestVirginia],
|    [WestVirginia, Maryland], [Maryland, Delaware], [Delaware, NewJersey],
|    [NewJersey, NewYork], [Virginia, WestVirginia], [Virginia, Maryland],
|    [Virginia, Kentucky], [Kentucky, Ohio], [Kentucky, Indiana], [Indiana, Ohio] ]).
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = green,
Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Indiana, Indiana = green,
Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Indiana, Indiana = green,
Virginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = green,
Virginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Virginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Kentucky, Kentucky = green,
WestVirginia = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Kentucky, Kentucky = green,
WestVirginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Indiana, Indiana = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Virginia, Virginia = Indiana, Indiana = green,
WestVirginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Virginia, Virginia = green,
WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Virginia, Virginia = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = NewYork, NewYork = Virginia, Virginia = Indiana, Indiana = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = green,
WestVirginia = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = green,
WestVirginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = Ohio, Ohio = Virginia, Virginia = green,
WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = green,
Ohio = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Indiana, Indiana = green,
Ohio = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Ohio = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Ohio = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = green,
Ohio = Virginia, Virginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Indiana, Indiana = green,
Ohio = Virginia, Virginia = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = green,
Ohio = Virginia, Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Indiana, Indiana = green,
Ohio = Virginia, Virginia = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Ohio = Virginia, Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = NewYork, NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
Ohio = Virginia, Virginia = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = green,
NewYork = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Indiana, Indiana = green,
NewYork = Kentucky, Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Indiana, Indiana = green,
NewYork = Virginia, Virginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = green,
NewYork = Virginia, Virginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Virginia, Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Virginia, Virginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Kentucky, Kentucky = green,
NewYork = WestVirginia, WestVirginia = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Kentucky, Kentucky = green,
NewYork = WestVirginia, WestVirginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Indiana, Indiana = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Virginia, Virginia = Indiana, Indiana = green,
NewYork = WestVirginia, WestVirginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Ohio, Ohio = blue,
Delaware = Virginia, Virginia = Indiana, Indiana = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = Ohio, Ohio = green,
NewYork = WestVirginia, WestVirginia = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = Ohio, Ohio = green,
NewYork = WestVirginia, WestVirginia = Indiana, Indiana = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = Ohio, Ohio = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = Ohio, Ohio = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Indiana, Indiana = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = Ohio, Ohio = Virginia, Virginia = green,
NewYork = WestVirginia, WestVirginia = Kentucky, Kentucky = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = WestVirginia, WestVirginia = green,
NewYork = Ohio, Ohio = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = WestVirginia, WestVirginia = Indiana, Indiana = green,
NewYork = Ohio, Ohio = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Ohio, Ohio = yellow ;
Penn = Virginia, Virginia = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Ohio, Ohio = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = WestVirginia, WestVirginia = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = Kentucky, Kentucky = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = WestVirginia, WestVirginia = Indiana, Indiana = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = WestVirginia, WestVirginia = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Kentucky, Kentucky = blue,
Delaware = WestVirginia, WestVirginia = Indiana, Indiana = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = Indiana, Indiana = red,
Maryland = NewJersey, NewJersey = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = red,
Maryland = NewJersey, NewJersey = Indiana, Indiana = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewYork = Ohio, Ohio = Virginia, Virginia = yellow ;
Penn = Virginia, Virginia = Indiana, Indiana = red,
Maryland = NewYork, NewYork = Ohio, Ohio = blue,
Delaware = WestVirginia, WestVirginia = Kentucky, Kentucky = green,
NewJersey = yellow ; It goes on for longer.

*/

/*

?- coloring( [ [NewYork,Vermont], [NewYork, Massachusetts], [NewYork, Connecticut], [Vermont, NewHampshire], [Vermont, Massachusetts], [Massachusetts, Connecticut], [Massachusetts, Vermont], [Massachusetts, NewHampshire], [Massachusetts, RhodeIsland], [Connecticut, RhodeIsland], [NewHampshire, Maine]]).
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
NewHampshire = yellow ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = blue,
Massachusetts = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = Maine, Maine = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = green,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = green,
Connecticut = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
NewHampshire = green ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = red,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = yellow,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = yellow,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
NewHampshire = yellow ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = Maine, Maine = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = green,
Massachusetts = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = blue,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = blue,
Connecticut = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = yellow,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = yellow,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
NewHampshire = blue ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = red,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = blue,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = blue,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
NewHampshire = green ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = green,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = green,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = red,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
NewHampshire = blue ;
NewYork = Maine, Maine = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = red,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = red,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
NewHampshire = yellow ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = green,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = red,
Massachusetts = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = Maine, Maine = green,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = green,
Connecticut = Maine, Maine = yellow ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
NewHampshire = green ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = blue,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = yellow,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = yellow,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = green ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
NewHampshire = yellow ;
NewYork = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = Maine, Maine = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = green,
Massachusetts = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = red,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = red,
Connecticut = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = yellow,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = yellow,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = yellow,
Connecticut = red ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = yellow,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = red,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = red,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
NewHampshire = green ;
NewYork = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = green,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = green,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = green,
Connecticut = red ;
NewYork = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = green,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = blue,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
NewHampshire = yellow ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = blue,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = red,
Massachusetts = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = Maine, Maine = blue,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = blue,
Connecticut = Maine, Maine = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = yellow,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = red,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = yellow,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = red,
Massachusetts = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = yellow,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = red,
Massachusetts = Maine, Maine = yellow,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
Maine = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
RhodeIsland = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
NewHampshire = yellow ;
NewYork = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = red,
Connecticut = Maine, Maine = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = Maine, Maine = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = blue,
Massachusetts = red,
Connecticut = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = red,
Connecticut = Maine, Maine = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = yellow ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = blue,
Massachusetts = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = yellow,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = yellow,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = blue,
Massachusetts = yellow,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = blue,
Massachusetts = Maine, Maine = yellow,
Connecticut = red ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = yellow,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = yellow ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = yellow ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = red,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = red,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = red,
Connecticut = blue ;
NewYork = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = red,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = blue,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = blue,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = yellow,
Massachusetts = Maine, Maine = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Massachusetts = blue,
Connecticut = red ;
NewYork = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = Maine, Maine = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = blue,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = yellow,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = green,
Vermont = Connecticut, Connecticut = Maine, Maine = yellow,
Massachusetts = blue ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = blue,
Maine = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = red,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = blue,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = red,
Massachusetts = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = Maine, Maine = blue,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = blue,
Connecticut = Maine, Maine = green ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = red,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = green,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = red,
Massachusetts = Maine, Maine = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = red,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = red,
Massachusetts = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = green,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = red,
Massachusetts = Maine, Maine = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = red,
Massachusetts = green,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = green,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = red,
Massachusetts = Maine, Maine = green,
Connecticut = blue ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red,
RhodeIsland = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
RhodeIsland = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = red,
Maine = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = blue,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = red,
Connecticut = Maine, Maine = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = Maine, Maine = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = blue,
Massachusetts = red,
Connecticut = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = red,
Connecticut = Maine, Maine = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = Maine, Maine = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = blue,
Massachusetts = green,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = green,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = blue,
Massachusetts = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = blue,
Massachusetts = Maine, Maine = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = green,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = blue,
Massachusetts = green,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = blue,
Massachusetts = Maine, Maine = green,
Connecticut = red ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = green,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = blue,
Massachusetts = green ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = blue,
Massachusetts = Maine, Maine = green ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = Maine, Maine = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = green,
Massachusetts = red,
Connecticut = NewHampshire, NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = red,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = Maine, Maine = red,
Connecticut = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = red,
Connecticut = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = green,
Massachusetts = red,
Connecticut = blue ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
NewHampshire = RhodeIsland, RhodeIsland = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
NewHampshire = blue ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
NewHampshire = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
RhodeIsland = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red,
RhodeIsland = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = red,
Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = red ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = Maine, Maine = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = Maine, Maine = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = green,
Massachusetts = blue,
Connecticut = NewHampshire, NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = blue,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = green,
Massachusetts = Maine, Maine = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = RhodeIsland, RhodeIsland = Maine, Maine = green,
Massachusetts = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = blue,
Connecticut = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = green,
Massachusetts = Maine, Maine = blue,
Connecticut = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Maine, Maine = green,
Massachusetts = blue,
Connecticut = red ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
NewHampshire = RhodeIsland, RhodeIsland = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
NewHampshire = red ;
NewYork = RhodeIsland, RhodeIsland = Maine, Maine = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
NewHampshire = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
RhodeIsland = Maine, Maine = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue,
RhodeIsland = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = blue,
Maine = red ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = green,
Massachusetts = Maine, Maine = blue ;
NewYork = NewHampshire, NewHampshire = RhodeIsland, RhodeIsland = yellow,
Vermont = Connecticut, Connecticut = Maine, Maine = green,
Massachusetts = blue ;
false.
*/