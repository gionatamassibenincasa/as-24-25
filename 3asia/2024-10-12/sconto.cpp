// file: sconto.cpp
// Dato il prezzo e la percentuale di sconto, calcola l'importo scontato
#include <iostream>
using namespace std;

int main() {
    double prezzo;
    int sconto_percentuale;
    
    cout << "Prezzo non scontato: ";
    cin >> prezzo;
    cout << "Percentuale di sconto: ";
    cin >> sconto_percentuale;
    double importo = prezzo * (1 - sconto_percentuale / 100.0);
    cout << "Prezzo scontato: " << importo << "\n";
    
    return 0;
}
