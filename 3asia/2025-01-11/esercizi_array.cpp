#include <iostream>

using namespace std;

/**
 * Stampa gli elementi di un array di interi.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 *
 * **Complessità temporale:** O(n), poiché ogni elemento dell'array viene visitato una sola volta.
 */
void stampa_array(int A[], int n) {
    cout << "{";
    for (int i = 0; i < n; i++) {
        cout << A[i];
        if (i < n - 1) {
            cout << ", ";
        }
    }
    cout << "}" << endl;
}

/**
 * Trova il valore minimo in un array di interi.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 * @return Il valore minimo nell'array.
 *
 * **Complessità temporale:** O(n), poiché ogni elemento dell'array viene visitato una sola volta.
 */
int minimo(int A[], int n) {
    int min = A[0];
    for (int i = 1; i < n; i++) {
        if (A[i] < min) {
            min = A[i];
        }
    }
    return min;
}

/**
 * Trova il valore massimo in un array di interi.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 * @return Il valore massimo nell'array.
 *
 * **Complessità temporale:** O(n), poiché ogni elemento dell'array viene visitato una sola volta.
 */
int massimo(int A[], int n) {
    int max = A[0];
    for (int i = 1; i < n; i++) {
        if (A[i] > max) {
            max = A[i];
        }
    }
    return max;
}

/**
 * Calcola la somma degli elementi di un array di interi.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 * @return La somma degli elementi dell'array.
 *
 * **Complessità temporale:** O(n), poiché ogni elemento dell'array viene visitato una sola volta.
 */
int somma(int A[], int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += A[i];
    }
    return sum;
}

/**
 * Calcola il prodotto degli elementi di un array di interi.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 * @return Il prodotto degli elementi dell'array.
 *
 * **Complessità temporale:** O(n), poiché ogni elemento dell'array viene visitato una sola volta.
 */
int prodotto(int A[], int n) {
    int prod = 1;
    for (int i = 0; i < n; i++) {
        prod *= A[i];
    }
    return prod;
}

/**
 * Cerca un valore in un array di interi e restituisce l'indice.
 *
 * @param A Puntatore all'array di interi.
 * @param n Dimensione dell'array.
 * @param valore Il valore da cercare.
 * @return L'indice del valore se trovato, altrimenti n.
 *
 * **Complessità temporale:** Nel caso peggiore O(n), se l'elemento non è presente o è l'ultimo elemento.
 */
int cerca(int A[], int n, int valore) {
    for (int i = 0; i < n; i++) {
        if (A[i] == valore) {
            return i;
        }
    }
    return n; // Se il valore non è trovato, restituisce n
}

int main() {
    int A[] = {3, 1, 2, 5, 4};
    int n = sizeof(A) / sizeof(A[0]); // Calcola la dimensione dell'array

    cout << "Array originale: ";
    stampa_array(A, n);

    cout << "Valore minimo: " << minimo(A, n) << endl;
    cout << "Valore massimo: " << massimo(A, n) << endl;
    cout << "Somma degli elementi: " << somma(A, n) << endl;
    cout << "Prodotto degli elementi: " << prodotto(A, n) << endl;

    int valoreDaCercare = 2;
    int indice = cerca(A, n, valoreDaCercare);
    if (indice < n) {
        cout << "L'elemento " << valoreDaCercare << " è stato trovato all'indice " << indice << endl;
    } else {
        cout << "L'elemento " << valoreDaCercare << " non è presente nell'array" << endl;
    }

    return 0;
}
