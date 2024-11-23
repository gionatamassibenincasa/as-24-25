// Array
#include <iostream>
#include <string>
using namespace std;

void stampa_array(double A[], const int n) {
    string out = "A: {";
    if (n > 0)
        out += to_string(A[0]);
    for (int i = 1; i < n; ++i)
        out += ", " + to_string(A[i]);
    out += "}\n";
    cout << out;
}

double somma_array(double A[], const int n) {
    double accumulatore = 0;
    // Solo per PythonTutor
    double *rif = A;
    for (int i = 0; i < n; ++i) {
        // Solo per PythonTutor
        rif = A + i;
        accumulatore += A[i];
    }
    return accumulatore;
}

int main() {
    const int N = 6;
    double temperature[N] =
        {24.2, 24.3, 24.1,
         23.9, 23.1, 22.2};
    stampa_array(temperature, N);
    cout << "Media: " << somma_array(temperature, N) / N << "\n";
    
    return 0;
}
