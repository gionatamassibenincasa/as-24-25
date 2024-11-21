// Passaggio degli argomenti
// per valore e per riferimento
#include <iostream>
using namespace std;

int incrementaVal(int n) {
    n = n + 1;
    return n;
}

int incrementaRif(int &n) {
    n = n + 1;
    return n;
}

int main() {
    int i = 5,
    j = incrementaVal(i);
    cout << "i: " << i << "\n"
        "j: " << j << "\n";
    
    int x = 5,
    y = incrementaRif(x);
    cout << "x: " << x << "\n"
        "y: " << y << "\n";
    
    return 0;
}
