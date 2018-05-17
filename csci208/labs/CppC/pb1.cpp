#include <string>
#include <iostream>

using namespace std;

int main() {

	// ********************** PART 1:

	// Problem 1:
	int a = 1, b = 1; // legal: normal ints

	// Problem 2:
	const int c = 1; // legal: const int

	// Problem 3:
	int * d = &a; // legal: normal pointer to a normal int

	// Problem 4:
	//int * e = &c; // illegal: e needs to be of type const int *

	// Problem 5:
	const int * f = &a; // legal: pointer to a constant int

	// Problem 6:
	const int * g = &c; // legal: const point to a const int

	// Problem 7:
	int * const h = &a; // legal: constant pointer to a normal int
	
	// Problem 8:
	const int * const i = &c; // legal: const pointer to const int
	
	// Problem 9:
	int & j = a; // legal: reference to a normal int

	// Problem 10:
	//int & k = c; // illegal: needs const tag

	// Problem 11:
	const int & m = a; // legal: reference to a const int

	// Problem 12:
	//int & const n = a; // illegal: 


	// ********************** PART 2:
	a = 2;
	//c = 2; // illegal: assignment of read-only variable 
	*d = 3;
	//*f = 3; // illegal: assignment of read-only location
	f = &b;
	//h = &b; // illegal: assignment of read-only variable
	//*j = 3; // illegal: invalid type argument of unary ‘*’ (have ‘int’)
	//m = 3; // illegal: assignment of read-only variable
}