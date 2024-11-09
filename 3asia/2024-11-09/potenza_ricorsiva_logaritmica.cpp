// Calcolo ricorsivo delle potenze

#include <iostream>
using namespace std;

bool pari (unsigned int numero) {
    return numero % 2 == 0;
}

double quadrato(double numero) {
    return numero * numero;
}

double potenza(double base, unsigned int esponente) {
    if (esponente == 0)
        return 1;
    if (pari(esponente))
        return potenza(quadrato(base), esponente / 2);
    return base * potenza(base, esponente - 1);
} 
 
int main() {
    cout << "2 alla 11 = " << potenza(2, 11) << "\n";

    return 0;
}
