#include"tree.h"
#include<iostream>
#include<string>
using namespace std;
/* If nullptr is causing an error then you are not correctly using C++11 */

BST::BST(){
	this->key = -1; // placeholder till you get a real value
	this->left = nullptr; // nullptr is the null pointer.
	this->right = nullptr;
	this->value = "";
}

bool BST::isleaf(){
	return (this->left == nullptr) && (this->right == nullptr);
}

/* Define the functions insert() and search() here according to their declaration in
the tree.h header file. */

// the function insert() inserts an element v at the given key k.
void BST::insert(int k, string v) {
	if (this->key == -1 && this->value == "") {
		this->key = k;
		this->value = v;
	} else if (k < this->key) {
		if (this->left == nullptr) {
			this->left = new BST();

		}
		this->left->insert(k, v);
	}
	else {
		if (this->right == nullptr) {
			this->right = new BST();
		}
		this->right->insert(k, v);
	}
}

// the function search() returns the value stored at the given key k.
string BST::search(int k) {
	BST *curr_BST = this;
	while (curr_BST != nullptr) {
		if (k == curr_BST->key) {
			return curr_BST->value;
		} else if (k < curr_BST->key) {
			curr_BST = curr_BST->left;
		} else {
			curr_BST = curr_BST->right;
		}
	}
	return "Not found!";
}


int main(){
	BST * t = new BST();

	t->insert(10,"Ten");
	t->insert(5,"Five");
	t->insert(12, "Twelve");
	t->insert(7, "Seven");
	t->insert(4, "Four");
	t->insert(11, "Eleven");
	
	cout << t->search(5) << endl;
	cout << t->search(10) << endl;
	cout << t->search(6) << endl;
	cout << t->search(7) << endl;
	cout << t->search(11) << endl;
	
	return 0;
}
