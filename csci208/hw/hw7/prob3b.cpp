// File: hw7 - problem 3 (a)
// Team: Andre Amirsaleh and Stefano Cobelli
// Course: CSCI 208 - Programming Language Design (1:00PM section)
// Prof: Benoit Razet
// Date: 10/21/16

#include <iostream>

using namespace std;

// PROBLEM 3 (b) -- actually does pass-by-reference (Hint: using the symbol &)
void foo(int &x) { x = 2; }

int main() {
	int z = 5;
	foo(z);
	cout << z << endl;
}