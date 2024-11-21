// Legge un numero e ne stampa la radice quadrata
#include <iostream>
#include <cmath>
using namespace std;

int main() {
    cout << "Immetti un numero: ";
    double numero;
    cin >> numero;
    cout << "Radice quadrata di "
         << numero
         << " = " << sqrt(numero)
         << "\n";

    return 0;
}
