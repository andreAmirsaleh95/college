// C++
// Compile: g++ friend.cpp -o friend
// Run: Friend

#include <iostream>
#include <string>
using namespace std;

// CLASS DEFINITIONS HERE
class RodeoClown  {
  friend class Bull;
public:
  void laugh();
  void gallop();
private:
  void dance();
};

class Bull {
  friend class Spectators;
private:
  bool excited; 
public:
  void charge(RodeoClown * clown);
};

class Spectators{
public:
  void applaude(Bull * bull);
};

// CODE HERE
void RodeoClown::dance() { cout << "run away!.\n"; }
void RodeoClown::laugh() { cout << "haha.\n"; }
void RodeoClown::gallop() { cout << "giddyup\n"; }
void Bull::charge(RodeoClown * clown) {
  if (excited) clown->dance();
  else cout << "Moooo" << endl;
}
void Spectators::applaude(Bull * bull){ bull->excited = true;}

int main() {
    RodeoClown * bob = new RodeoClown();
    bob->laugh();
    bob->gallop();

    // normal people cannot make bob dance
    // bob->dance();

    // The bull can
    Bull * bull = new Bull();
    Spectators * people = new Spectators();
    bull->charge(bob);
    people->applaude(bull);
    bull->charge(bob);
}
