#include <iostream>
using namespace std;

int foo() {
	int i = 5; int *p = &i; int &r = *p;
	*p += r;
	cout << i << " " << *p << " " << r << endl;
	return 0;
}

int main() {
	// 3.1
	//int &reference;
	cout << "3.1) No." << endl;

	// 3.2
	int *pointer;
	cout << "3.2) Yes." << endl;

	// 3.3
	int one = 1;
	int &ref = one;
	int two = 2;
	// &ref = 2;
	cout << "3.3) No." << endl;

	// 3.4
	pointer = &one;
	pointer = &two;
	cout << "3.4) Yes." << endl;

	// 3.5
	foo();
	cout << "3.5) *p and &r are both accessing the same memory location to retrieve their data." << endl;

	return 0;
}