// Programmazione Orientata agli Oggetti: un esempio di classe

#include <iostream>
#include <string>
using namespace std;

class Driver {
  private:
    string cognome;
    string nome;

  public:
    Driver(string c, string n) : cognome{c}, nome {n}
        {}
    void stampa() {
        cout << cognome << " " << nome << endl;
    }
};

int main() {
    Driver d1 { "Rossi", "Valentino"},
    d2 {"Márquez Alentà", "Marc"};
    d1.stampa();
    d2.stampa();
    return 0;
}
