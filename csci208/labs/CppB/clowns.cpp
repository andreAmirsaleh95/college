#include <iostream>
#include <string>

using namespace std;

class Clown {
public:
	string name;
	Clown(string newName) {
		this->name = newName;
	};
	virtual void dance() {
		cout << name << " twirls like a ballerina" << endl;
	};
};

class CircusClown: public Clown {
public:
	CircusClown(string newName): Clown(newName) {};
	void dance() {
		cout << name << " hops up and down" << endl;
	};
};

int main(int argc, char *argv[]) {
	Clown *carl = new Clown("Carl"); // Here's Carl
	// Clowns twirl
	carl->dance(); // Make Carl dance.

	CircusClown *joe = new CircusClown("Joe");
	// Circus Clowns hop
	joe->dance(); // Make Joe dance.
	
		// Implicit Coercion
	Clown *bob = new CircusClown("Bob");
	// Does bob twirl or hop?
	bob->dance(); 

		// Explicit Coercion
	Clown *joeJr = joe;
	// Does joeJr twirl or hop?
	joeJr->dance();

	return 0;
}