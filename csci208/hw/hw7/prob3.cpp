// Team: Andre Amirsaleh and Stefano Cobelli
// Assignment: hw7 - Problem 3(a)
// Course: CSCI 208 - Programming Language Design (1:00PM section)
// Prof: Benoit Razet
// Date: 10/21/16

// PROBLEM 3 (a) -- fakes pass-by-reference like Java by passing the address of an int
#include <iostream>

using namespace std;

void foo(int *x) { x = 2; }

int main() {
	int z = 5;
	foo(&z);
	cout << z << endl;
}