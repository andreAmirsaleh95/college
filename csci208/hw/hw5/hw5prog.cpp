// Author: Andre Amirsaleh
// Date: 10/7/16
// Course: CSCI 208 - Programming Language Design (2:00PM section)
// Prof: Benoit Razet

#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

class Node {
public:
	int x;
	Node * previous; Node * next;
};

// First In First Out Queue
class Fifo {
public:
	Node * head;
	Node * tail;
	Fifo();
	void produce( int );
	void consume( int );
};

Fifo::Fifo() {
	head = NULL;
	tail = NULL;
}

// Add to FIFO queue
void Fifo::produce( int x ) {
	Node * n = new Node();
	n->x = x;
	if ( head == NULL ) { // empty fifo
		head = n;
		tail = n;
		n->previous = NULL;
		n->next = NULL;
	} else { // goes first
		n->previous = NULL;
		n->next = head;
		head->previous = n;
		head = n;
		// tail is the same
	}
}

// Remove from FIFO queue
void Fifo::consume( int v ) {
	for ( Node * temp = tail; temp != NULL; temp = tail ) {
		if ( temp->previous == NULL ) {
			if ( temp->x <= v ) {
				tail = NULL;
				delete tail; // <-- ADDED THIS LINE (prev problem)
				head = NULL;
				delete head; // <-- ADDED THIS LINE (prev problem)
				return ;
			} else { // temp−>x > v
				temp->x -= v;
				/* ***************** Point 1 ****************** */
				free(temp); // <-- This is Point 1
				return ;
			}
		} else {
			if ( temp->x < v ) {
				v -= temp->x;
				tail = temp->previous;
				tail->next = NULL;
				delete tail->next; // <-- ADDED THIS LINE (prev problem)
			} else {
				if ( temp->x == v ) {
					tail = temp->previous;
					tail->next = NULL;
					delete tail->next; // <-- ADDED THIS LINE (prev problem)
					return ;
				} else { // temp->x > v
					temp->x -= v;
					return ;
				}
			}
		}
	}
}

void printl( Fifo l ) {
	for ( Node * temp = l.head; temp != NULL; temp = temp->next ) {
		cout << temp->x << " ";
	}
	cout << endl;
}

// int main() {
// 	Fifo l;

// 	l.produce( 7 );
// 	printl( l );

// 	l.consume( 2 );
// 	printl( l );

// 	l.produce( 3 );
// 	printl( l );

// 	l.consume( 4 );
// 	printl( l );

// 	l.produce( 2 );
// 	printl( l );

// 	l.consume( 3 );
// 	printl( l );

// 	l.produce( 18 );
// 	printl( l );

// 	l.consume( 3 );
// 	printl( l );

// 	l.produce( 6 );
// 	printl( l );

// 	l.consume( 30 );
// 	printl( l );
// }

int main() {
	Fifo l;

	l.produce( 5 );
	l.consume( 4 );
	l.produce( 7 );
	printl( l );
}