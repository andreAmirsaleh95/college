#include <iostream>
using namespace std;

void printStuff(char *stuff) {
	std::cout << stuff << std::endl;
}


int main() {

	// Prob 2.1
	cout << "int:" << sizeof(int) << endl;
	cout << "char:" << sizeof(char) << endl;
	cout << "bool:" << sizeof(bool) << endl;
	cout << "short:" << sizeof(short) << endl;
	cout << "long:" << sizeof(long) << endl;
	cout << "long long:" << sizeof(long long) << endl;
	cout << "float:" << sizeof(float) << endl;
	cout << "double:" << sizeof(double) << endl;

	// Prob 2.2:
	double myDouble = 1;
	cout << "myDouble = 1" << endl;
	float myFloat = 1.2;
	double myDouble2 = myFloat;
	cout << "myDouble = myFloat" << endl;

	// Prob 2.3
	myFloat = myDouble;
	cout << "myFloat = myDouble" << endl;
	int myInt = myFloat;
	cout << "myInt = myFloat" << endl;
	return 0;

	// Prob 2.4
	// TODO: Get answer from class notes
}