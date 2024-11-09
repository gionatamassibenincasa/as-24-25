// Calcolo ricorsivo delle potenze

#include <iostream>
using namespace std;

double potenza(double base, unsigned int esponente) {
    if (esponente == 0)
      return 1;
    return base *
      potenza(base, esponente - 1);
} 
 
int main() {
    cout << "2 alla terza = " << potenza(2, 3) << "\n";

    return 0;
}
