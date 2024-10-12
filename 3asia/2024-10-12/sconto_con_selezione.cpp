// file: sconto_con_selezione.cpp
// Dato il prezzo, la quantità e la percentuale di sconto,
// se la quantità è almeno 10, sconta l'importo
// e stampa l'importo totale
#include <iostream>
using namespace std;

int main() {
    double prezzo;
    int quantita;
    int sconto_percentuale;
    
    cout << "Prezzo non scontato: ";
    cin >> prezzo;
    cout << "Quantita: ";
    cin >> quantita;
    double importo = prezzo * quantita;
    if (quantita >= 10) { 
        cout << "Percentuale di sconto: ";
        cin >> sconto_percentuale;
        importo *= (1 - sconto_percentuale / 100.0);
    }
    cout << "Totale a pagare: " << importo << "\n";
    
    return 0;
}
