// Stampa i piloti del campionato di Formula 1 2024.
// 
// Presentazione del concetto di strutture, passaggio di parametri per valore e riferimento
#include <iostream>
#include <string>
using namespace std;

struct Pilota {
    int numero;
    string cognome;
    string nome;
    char acronimo[4];
    char nazione[4];
};

void stampaSchedaPilota(Pilota &p) {
    cout << "Numero: " << p.numero << "\n";
    cout << "Cognome: " << p.cognome << "\n";
    cout << "Nome: " << p.nome << "\n";
    cout << "Acronimo: " << p.acronimo << "\n";
    cout << "Nazione: " << p.nazione << "\n";
}

void stampaSchedePiloti(Pilota ps[], int n) {
    cout << "# Elenco dei piloti censiti\n\n";
    if (n > 0)
        stampaSchedaPilota(ps[0]);
    for (int i = 1; i < n; ++i) {
        cout << "\n====================\n\n";
        stampaSchedaPilota(ps[i]);
    }
}

int main() {
    Pilota Max {1, "Verstappen", "Max", "VER", "NED"};
    Pilota Charles {16, "Leclerc", "Charles", "LEC", "MON"};
    Pilota Carlos {55, "Sainz", "Carlos", "SAI", "ESP"};
    Pilota piloti[3] {Max, Charles, Carlos};
    
    stampaSchedePiloti(piloti, sizeof(piloti)/sizeof(Pilota));
    return 0;
}
