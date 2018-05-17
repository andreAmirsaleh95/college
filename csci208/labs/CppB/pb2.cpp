#include <iostream>
using namespace std;


class Pb2 {
public:
	static int x;
	int y;
	void print();
	void change(int n);
	Pb2() {
		y = 2;
		z = 3;
	};
private:
	int z;
};

int Pb2::x = 1;

void Pb2::print() {
	cout << "y = " << this->y << endl;
}

void Pb2::change(int n) {
	this->y = n;
}

int main() {
	Pb2 obj1 = Pb2(); // notice we did NOT use new here
	Pb2 obj2 = obj1;
	obj1.print();
	obj2.print();
	obj1.change(42); // change a member data to 42
	obj1.print();
	obj2.print();
}