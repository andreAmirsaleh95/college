#include<iostream>
using namespace std;

template<typename A, typename B, typename C>
class Triple{
public:
    A first;
    B second;
    C third;

    Triple(A a, B b, C c){ first = a; second = b; third = c;}

    A fst(){return first;}
    B snd(){return second;}
    C thd(){return third;}

    // The function change1(), changes the first component of a triple. 
    void change1(A a){ first = a;}
};

// A linked list of triples where the order of the triple rotates as it goes.
template<typename A, typename B, typename C>
class RotateList{ 
public:
    Triple<A,B,C> *t;
    RotateList<B,C,A> * next; // Notice the order has changed

    RotateList(Triple<A,B,C> *t1, RotateList<B,C,A> * n1){ this->t = t1; this->next = n1;}

    /* create() is a class member function (static), creating a rotating list of length i.
     * Notice that the function is recursive. It creates i triples, each with
     * the order rotated from the previous triple.
     * If nullptr does not compile, then you are not properly compiling as C++11.
     */
    static RotateList<A,B,C> * create(A a, B b, C c, int i){
	if (i <= 0) return nullptr;
	Triple<A,B,C> * t = new Triple<A,B,C>(a,b,c);
	RotateList<B,C,A> * n = RotateList<B,C,A>::create(b,c,a, i-1); 
    
	return new RotateList<A,B,C>(t, n);
    }

    /* Complete the function create2() such that it behaves
     * as specified by the output in the lab. Notice how the changed numbers
     * repeat down the list.
     * HINT: create2() should be ITERATIVE instead of recursive.
     * Create the three triples (not i triples) in the list 
     * and then use a loop to assemble them into a rotating list. In order to 
     * have change1() produce the desired repetition, you will need to use 
     * the instances of the same three triples over and over in the rotating list.
     */
    static RotateList<A,B,C> * create2(A a, B b, C c, int i){
        if (0 > i) {
            return nullptr;
        } 
        Triple<A,B,C> * t1 = new Triple<A,B,C>(a, b, c);
        Triple<B,C,A> * t2 = new Triple<B,C,A>(b, c, a);
        Triple<C,A,B> * t3 = new Triple<C,A,B>(c, a, b);
        RotateList<A,B,C> * head = new RotateList<A,B,C>(t1, nullptr);
        RotateList<A,B,C> * r1 = head;
        RotateList<B,C,A> * r2 = new RotateList<B,C,A>(t2, nullptr);
        RotateList<C,A,B> * r3 = new RotateList<C,A,B>(t3, nullptr);
        int j;
        for (j = 0; j < (i - 1); j++) {
            if (j % 3 == 0) {
                r1->next = new RotateList<B,C,A>(t2, nullptr);
                r2 = r1->next;
            } else if (j % 3 == 1) {
                r2->next = new RotateList<C,A,B>(t3, nullptr);
                r3 = r2->next;
            } else { // j % 3 == 2
                r3->next = new RotateList<A,B,C>(t1, nullptr);
                r1 = r3->next;
            }
        }
        return head;
    }

    /* Print the whole rotating list. */ 
    void print(){
	cout << "{" << t->fst() << " "<< t->snd() << " "<< t->thd() << "}";
	if (next != nullptr) 
	    next->print();
	else 
	    cout << endl;
    }
};


int main(){
    float f = 3.14;
    int i = 3;
    char c = 'c';

    Triple<float,int,char> t = Triple<float,int,char>(f,i,c);
    Triple<float,int,char> t1 = t;
    cout << "Starting triple: [" << t.fst() << " "<< t.snd() << " "<< t.thd() << "]" << endl;

    cout << endl << "Rotating list created recursively" << endl;
    RotateList<float,int,char> * r= RotateList<float,int,char>::create(f,i,c, 10);
    r->print();

    r->t->change1(42.42);
    r->print();

    cout << endl << "Rotating list created iteratively" << endl;
    RotateList<float,int,char> * s= RotateList<float,int,char>::create2(f,i,c, 10);
    s->print();

    s->t->change1(42.42);
    s->print();
    
    s->next->t->change1(501);
    s->print();
}
