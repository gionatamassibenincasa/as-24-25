#include <iostream>
#include <iomanip>
using namespace std;

/** Restituisce il numero della sequenza di Fibonacci in posizione n.
  * \param n la posizione nella sequenza di Fibonacci, dove 0 è il primo indice
  * \return il numero della sequenza di Fibonacci in posizione \var n.
  *
  * I casi base sono due:
  *   - Fibonacci(0) = 0 e
  *   - Fibonacci(1) = 1.
  * Il caso ricorsivo è:
  *   - Fibonacci(n) = Fibonacci(n-2) + Fibonacci(n-1).
  */  
int Fibonacci(int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    return Fibonacci(n-2) + Fibonacci(n-1);
}

int main() {
    const int inizio = 0, fine = 11;
    for (int i = inizio; i < fine; ++i)
        cout << "Fibonacci(" << setw(2) << i << ") = "
             << setw(4) << Fibonacci(i) << "\n";
    return 0;
}
