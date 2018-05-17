// CSCI 208 - hw7
// Team: Andre Amirsaleh and Stefano Cobelli
// Course: CSCI 208 - Programming Language Design (1:00PM section)
// Prof: Benoit Razet
// Date: 10/21/16

#include <iostream>
#include <string>

using namespace std;

bool printStuffTrue(string s) {
	cout << s << endl;
	return true;
}

bool printStuffFalse(string s) {
	cout << s << endl;
	return false;
}

int main() {
	if (printStuffFalse("This is false, so the next call to printStuffTrue (as the second operand for the && (\"and\") operator) should never be executed if C++ uses short circuit evaluation.") && printStuffTrue("NO SHORT CIRCUIT EVALUATION (&&)")) {
		cout << "false && anything evaluates to false, so this should never print." << endl;
	}
	if (printStuffTrue("This is true, so no need to execute the next call to printStuffFalse") || printStuffFalse("NO SHORT CIRCUIT EVALUATION (||)")) {
		cout << "true || anything evaluates to true, so evaluating the second half of such an expression would be a waste of time." << endl;
	}
	
	return 0;
}