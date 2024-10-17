// file: somma_primi_5_numeri_for.cpp
// Stampa la somma dei numeri 1 + 2 + 3 + 4 + 5
#include <iostream>
#include <cassert>
using namespace std;


int main() {
    const int n = 5;
    int accumulatore = 0;
    for(int indice = 1; indice <= n; ++indice) {
        // blocco di istruzioni
        accumulatore += indice;        
    }
    // TEST: controllo la correttezza della soluzione
    assert(accumulatore = n * (n + 1) / 2);
    cout << "La somma dei numeri naturali compresi "
        "tra 1 e " << n << " e' pari a "
        << accumulatore << "\n";

    return 0;
}
