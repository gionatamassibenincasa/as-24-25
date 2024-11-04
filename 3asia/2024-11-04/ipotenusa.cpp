/* Il programma calcola l'ipotenusa dati i due cateti */

#include <iostream>
using namespace std;

/** Calcola il quadrato di un numero
  *
  * \param x un numero
  * \return il quadrato del numero, cioè il numero moltiplicato per se stesso
  */
double quadrato(double x) {
    return x * x;
}

/** Calcola il valor medio tra due numeri 
  *
  * \param a un numero
  * \param b un altro numero
  * \return il valor medio tra a e b, ossia (a + b) / 2
  */
double valor_medio(double a, double b) {
    return (a + b) / 2;
}

/** Aggiorna la stima della radice quadrata dato il radicando
  * 
  * \param stima la stima corrente
  * \param radicando il radicando
  * \return la nuova stima
  */
double aggiorna_stima(double stima, double radicando) {
    return valor_medio(stima, radicando / stima);
}

/** Calcola il valore assoluto di un numero
  *
  * \param x un numero
  * \return il numero senza segno
  */
double valore_assoluto(double x) {
    if (x >= 0)
        return x;
    return -x;
}

/** Determina se la stima approssima in modo sufficientemente accurato il radicando
  * 
  * \param stima la stima corrente
  * \param radicando il radicando
  * \return true se la stima è sufficientemente accurata, false altrimenti
  */
bool suff_accurata(double stima, double radicando) {
    return valore_assoluto(quadrato(stima) - radicando) < 1E-12;
}

/** Calcola la radice quadrata del radicando a partire da una stima
  *
  * \param radicando il radicando
  * \param stima la stima corrente
  * \return un'apporossimazione della radice quadrata
  */
double radq_iter(double radicando, double stima) {
    if (suff_accurata(stima, radicando))
        return stima;
    return radq_iter(radicando, aggiorna_stima(stima, radicando));
}

/** Calcola la radice quadrata del radicando
  *
  * \param radicando il radicando
  * \return una stima della radice quadrata
  */
double radq(double radicando) {
    return radq_iter(radicando, radicando / 2);
}

/** Calcola l'ipotenusa di un triangolo rettangolo dati i cateti
  * 
  * \param c1 un cateto
  * \param c2 un altro cateto
  * \return l'ipotenusa
  */
double ipotenusa(double c1, double c2) {
    return radq(quadrato(c1) + quadrato(c2));
}

/** Il test del programma */
int main() {
    cout << ipotenusa(3, 4) << endl;
    return 0;
}
