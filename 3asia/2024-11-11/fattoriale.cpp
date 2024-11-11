#include <iostream>
#include <iomanip>
using namespace std;

int fattoriale (int n) {
    if (n == 0)
        return 1;
    return n * fattoriale(n-1);
}

int main() {
    const int inizio = 0, fine = 11;
    for (int n = inizio; n < fine; ++n) {
        cout << setw(2) << n << "! = " << fattoriale(n) << "\n";
    }
    
    return 0;
}
