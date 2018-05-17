// Team: Andre Amirsaleh and Stefano Cobelli

#include <iostream>

using namespace std;

void foo(int * x [] ) {
	*(x[0]) = 2;
	x[1] = new int;
	*(x[1]) = 5;
}

int main() {
	int * a[2]; // formally a : int −> (Null + Ref int)
	a [0] = new int;
	a [1] = new int;
	*(a[0]) = 8;
	*(a[1]) = 3;
	foo(a);
	cout << *(a[0]) << endl;
	cout << *(a[1]) << endl;
}