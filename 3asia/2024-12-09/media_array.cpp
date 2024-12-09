
#include <random>
#include <iostream>
using namespace std;

void stampa_array_int(int A[], int n) {
    cout << "{";
    if (n > 0)
        cout << A[0];
    for (int i = 1; i < n; ++i) {
        cout << ", " << A[i];
    }

    cout << "}\n";
}

int somma(int A[], int n) {
    int accumulatore = 0;
    for (int i = 0; i <  n; ++i)
        accumulatore += A[i];

    return accumulatore;
}

int main() {
    std::random_device rd;
    std::uniform_int_distribution<int> dist(1, 10);
    const int N = 100;
    int A[N];

    for (int i = 0; i < N; ++i)
        A[i] = dist(rd);

    stampa_array_int(A, N);
    cout << "Media: " << static_cast<double>(somma(A, N)) / N << endl;

    return 0;
}
