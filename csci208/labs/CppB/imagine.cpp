#include "imagine.h"
using namespace std;

Imag::Imag(double r, double i) {
	this->real = r;
	this->imag = i;
}

/* add is a method that the first imag calls on the second imag. It returns
     a third Imag with the answer without modifying the first or second Imags. */
Imag Imag::add(Imag i) {
	Imag *img = new Imag(this->real + i.real, i.imag + this->imag);
	return *img;
}

/* mult is a method that the first imag calls on the second imag. It returns
     a third Imag with the answer without modifying the first or second Imags. */
Imag Imag::mult(Imag i) {
	Imag *img = new Imag(this->real * i.real - this->imag * i.imag, this->real * i.imag + this->imag * i.real);
	return *img;
}

/* The + operator needs to declare and return an Imag (not n1 or n2). 
   This Imag is the result of calling the add() method above. */
Imag operator+(Imag n1, Imag n2) {
	return n1.add(n2);
}

/* The * operator needs to declare and return an Imag (not n1 or n2) 
   This Imag is the result of calling the mult() method above. */
Imag operator*(Imag n1, Imag n2) {
	return n1.mult(n2);
}

/* The << operator prints the Imag to the ostream c (it might not always be cout). */
ostream & operator<<(ostream &c, Imag n) {
	return c << n.real << " + i" << n.imag;
}

/* Get main's code from the lab and put it in the cpp file. */
int main() {
	Imag n1 = Imag(0.3, 0.2);
	Imag n2 = Imag(0.6, 0.75);
	cout << n1 << endl;
	cout << n2 << endl;
	cout << "n1 + n2 = " << (n1+n2) << endl;
	cout << "n1 * n2 = " << (n1*n2) << endl;
	cout << "n1 * n1 * n1 * n1 = " << (n1 * n1 * n1 * n1) << endl;
	return 0;
}