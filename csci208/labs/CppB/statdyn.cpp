#include <iostream>
#include <string>

using namespace std;

void print(string s) {
	cout << s << endl;
}

class A{
	virtual void f() { print("Method from A");}
	public:
		void g() { f(); }
};

class B: public A{
	void f() { print("Method from B");}
};

int main(){
	B b;
	b.g();
}