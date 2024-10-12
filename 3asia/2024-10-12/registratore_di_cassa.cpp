// file: registratore_di_cassa.cpp
// Dato il numero totale di articoli, legge il prezzo,
// calcola e stampa l'importo totale
#include <iostream>
using namespace std;

int main() {
    double prezzo;
    int numeroPezzi;
    double totale = 0;
    
    
    cout << "Numero di pezzi: ";
    cin >> numeroPezzi;
    int pezzoCorrente = 1;
    while (pezzoCorrente <= numeroPezzi) {
        cout << "Prezzo: ";
        cin >> prezzo;
        totale += prezzo;
        pezzoCorrente++;
    }
    
    cout << "Totale: " << totale << "\n";

    return 0;
}
