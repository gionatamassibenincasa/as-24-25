<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenicasa.it

version:  2024-10-10

language: it

narrator: IT Italian Male

comment:  Appunti del corso di Informatica - Classe 3A Mod SIA - Anno Scolastico 24/25
          Alcune frasi sono tratte da:
            Bjarne Stroustrup - Programming Principles and Practice Using C++ 
        

import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md

import: https://raw.githubusercontent.com/liascript-templates/plantUML/master/README.md
-->

# C++ - AS 2024-25 - 3A Mod SIA

Introduzione al linguaggio C++ e principi di programmazione

__Se non vedi una presentazione, eseguilo su LiaScript:__

https://liascript.github.io/course/?https://raw.githubusercontent.com/gionatamassibenincasa/as-24-25/refs/heads/main/3asia/README.md

> Programmare è capire
>
> Kristen Nygaarsd

## La programmazione e la comprensione

> * La programmazione è l'arte di esprimere soluzioni ai problemi in modo che un computer possa eseguirle.
> * Spesso un problema viene compreso appieno solo attraverso il processo di programmazione di una soluzione.
> * La nostra civiltà funziona grazie al software. Senza comprendere il software sei ridotto a credere nella “magia” e sarai escluso da molti dei campi di lavoro tecnici più interessanti, redditizi e socialmente utili.
> * Come la matematica, la programmazione è un prezioso esercizio intellettuale che affina la nostra capacità di pensare. Tuttavia, grazie al feedback del computer, la programmazione è più concreta della maggior parte delle forme di matematica e quindi accessibile a più persone.
> * Le persone spesso sottovalutano la complessità della programmazione e il suo valore.
> * La programmazione si apprende scrivendo programmi. In questo, la programmazione è simile ad altre attività con una componente pratica. Non puoi imparare a nuotare, a suonare uno strumento musicale o a guidare un’auto solo leggendo un libro: devi esercitarti. Né puoi imparare a programmare senza leggere e scrivere molto codice.
> * Devi scrivere programmi e abituarti agli strumenti per scrivere, compilare ed eseguire programmi. Devi commettere i tuoi errori e imparare a correggerli. Non esiste alcun sostituto per imparare a programmare.
>
> Bjarne Stroustrup - Programming Principles and Practice Using C++ 

## Sviluppare un programma

Possiamo descrivere lo sviluppo di un programma come composto da quattro fasi:

* *Analisi*: qual è il problema? Cosa vuole l'utente? Di cosa ha bisogno l'utente? Cosa può permettersi l'utente? Di che tipo di affidabilità abbiamo bisogno?

* *Progettazione*: come risolviamo il problema? Quale dovrebbe essere la struttura complessiva del sistema? Da quali parti è composto? Come comunicano tra loro queste parti? Come comunica il sistema con i suoi utenti?

* *Programmazione*: esprimere la soluzione al problema (la progettazione) nel codice. Scrivi il codice in modo da soddisfare tutti i vincoli (tempo, spazio, denaro, affidabilità e così via). Assicurati che il codice sia corretto e gestibile.

* *Test*: assicurarsi che il sistema funzioni correttamente in tutte le circostanze richieste provandolo sistematicamente.

## Perché il C++

* Non si può imparare a programmare senza un linguaggio di programmazione
* Lo scopo di un linguaggio di programmazione è pemettere di esprimere le idee in codice
* C++ e il linguaggio che permette l'espressione diretta delle idee in una vasta area applicativa
* C++ è il linguaggio più diffuso nell'area dell'ingengeria
* È uno standard
* È disponibile quasi tutti i computer e permette di scrivere programmi per quasi tutti i dispositivi
* I concetti di programmazione che apprendi con il C++ possono essere impiegati per programmare usando altri linguaggi

## Il design del C++

* Scopo: aiutare ad esprimere le idee sui processi di calcolo.

- Per garantire l'efficienza

    + mappatura diretta dei tipi definiti dallo hardware

    + mappatura diretta delle operazioni definite dallo hardware

## I fondamenti

Il C++ è un linguaggio compilato.

```text @plantUML
@startuml
(sorgente 1) --> (oggetto 1) : compilazione
(sorgente 2) --> (oggetto 2) : compilazione
(oggetto 1) --> (eseguibile) : collegamento
(oggetto 2) --> (eseguibile) : collegamento
@enduml
```

## Ciao, Mondo!

> S'impara a programmare scrivendo programmi.
>
> — Brian Kernighan

Per far fare qualcosa ad un computer, qualcuno deve dirgli esattamente e con i più minuziosi dettagli, cosa fare. La descrizione del "cosa fare" è chiamata **programma** e la *programmazione* è l'attività di scrittura e validazione di questi programmi.

Un *linguaggio di programmazione* è un linguaggio con una specifica grammatica e un ben definito vocabolorio progettato per descrivere "cose" ad un computer. 

## Il programma più piccolo possibile

Scopo di questo programma è quello di sperimentare l'ambiente di programmazione, prendere confidenza con la nozione di programma, l'idea di traduzione dal codice leggibile dall'essere umano a quello per la macchina, e infine l'esecuzione del programma. 

```cpp
// file: ridotto.cpp
int main() {}
```

Per scoprire gli artefatti intermedi del processo di compilazione, tramite shell lancia il comando

```sh
g++ -save-temps -fverbose-asm -OO ridotto.cpp -o ridotto
ls
```

``` text
ridotto  ridotto.cpp  ridotto.ii  ridotto.o  ridotto.s
```

```sh
cat ridotto.ii
```

``` text ridotto.ii 
# 0 "ridotto.cpp"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>"
# 1 "ridotto.cpp"

int main() {}
```

```sh
cat ridotto.s
```

``` text ridotto.s
        .file   "ridotto.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#       compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
        .text
        .globl  main
        .type   main, @function
main:
.LFB0:
        .cfi_startproc
        endbr64
        pushq   %rbp    #
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp      #,
        .cfi_def_cfa_register 6
# ridotto.cpp:2: int main() {}
        movl    $0, %eax        #, _1
        popq    %rbp    #
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE0:
        .size   main, .-main
        .ident  "GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
        .section        .note.GNU-stack,"",@progbits
        .section        .note.gnu.property,"a"
        .align 8
        .long   1f - 0f
        .long   4f - 1f
        .long   5
0:
        .string "GNU"
1:
        .align 8
        .long   0xc0000002
        .long   3f - 2f
2:
        .long   0x3
3:
        .align 8
4:
```

* Ciascun programma C++ deve avere **esattamente** una funzione globale `main`.
* Il programma inizia eseguendo la funzione `main`.
* Il valore restituo dalla funzione `main` è un codice d'errore che viene usato dal sistema operativo. Il valore è 0 indica che l'esecuzione è avvenuta correttamente.

## Ciao Mondo  - Codice

Questa è una versione C++ del classico primo programma. Questo scrive "Ciao, Mondo!" sullo schermo.

``` c
// Questo programma stampa a video il messaggio "Ciao, Mondo!"
#include <iostream>

int main() {
    // Stampa "Ciao, Mondo!"
    std::cout << "Ciao, Mondo!\n";

    return 0;
}
```
@LIA.cpp

``` c
// Per evitare le inclusioni nel C++ moderno si usano i moduli
//
// Compilare con:
// g++ -std=c++20 -fmodules-ts -xc++-system-header iostream
// g++ -fmodules-ts -std=c++20 -o ciao -O0 -fverbose-asm -save-temps ciao.cpp

import <iostream>;

int main() {
    // Stampa "Ciao, Mondo!"
    std::cout << "Ciao, Mondo!\n";

    return 0;
}
```

``` c
// Per evitare le inclusioni nel C++ moderno si usano i moduli
//
// Compilare con:
// g++ -std=c++20 -fmodules-ts -xc++-system-header iostream
// g++ -fmodules-ts -std=c++20 -o ciao -O0 -fverbose-asm -save-temps ciao.cpp

import std;

int main() {
    // Stampa "Ciao, Mondo!"
    std::cout << "Ciao, Mondo!\n";

    return 0;
}
```

## Ciao Mondo - esecuzione

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=//%20Questo%20programma%20stampa%20a%20video%20il%20messaggio%20%22Ciao,%20Mondo!%22%0A%23include%20%3Ciostream%3E%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20//%20Stampa%20%22Ciao,%20Mondo!%22%0A%20%20%20%20std%3A%3Acout%20%3C%3C%20%22Ciao,%20Mondo!%5Cn%22%3B%0A%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

## Ciao Mondo - spiegazione della sintassi

* L'operatore `<<` è detto *poni in* e scrive il secondo argomento sul primo.
* `"Ciao Mondo!\n"` è un letterale stringa, una sequenza di caratteri racchiusa tra doppi apici, `'\n'` è carattere *newline*.
* `std::` specifica lo spazio dei nomi.
* `#include <iostream>` specifica al pre-elaboratore di includere le definizioni delle risorse presenti nel file `iostream` e in quelli da lui inclusi.
* `int main()` precedere la definizione della funzione a partire dalla quale viene eseguito il programma. La definizione sarà descritta tra le parentesi `{` e `}`.
* Le parentesi `{` e `}` esprimono il raggruppamento in C++.
* `cout` è una risorsa che gestisce la scrittura sullo schermo. Viene pronunciato "si-out" ed è un'abbreviazione di *character output stream*.
* `return 0` restituisce il controllo al sistema operativo comunicando il codice di errore 0, ovvero uscita con successo.
* `// Stampa "Ciao, Mondo!"` è un commento che fornisce informazioni utili ad un essere umano ma è ignorato dal compilatore

## Note sui primi programmi

* Un programma è scritto per due lettori: i computer che devono eseguirlo e gli esseri umani che devono leggerlo, modificarlo, comprenderlo...
* Scrivere codice in un linguaggio di alto livello è una forma di comunicazione tra esseri umani
* L'essere umano è il principale destintario di un codice scritto in un linguaggio di alto livello
* Il codice è scritto per essere letto, non solo eseguito
* Le prime righe di un programma non banale, generalmente, sono commenti per esseri umani

## I commenti

* `// Questo programma stampa a video il messaggio "Ciao, Mondo!"` è un commento
* Un programma dovrebbe iniziare con un commento che ne spiega sinteticamente quale è lo scopo
* Tutto ciò che è scritto dopo il token ``//``, letto *slash slash* è un commento
* I commenti sono indirizzati dagli esseri umani e sono ignorati dal compilatore




## Ciao ...


``` c
#include <iostream>
#include <string>
using namespace std;

int main() {
    string nome;
    cout << "Come ti chiami? ";
    cin >> nome;
    cout << "Ciao " << nome << "!" << endl;

    return 0;
}
```
@LIA.cpp

## Somma di due numeri

``` c
#include <iostream>
using namespace std;

int main() {
    int a1 = 4,
        a2 = 9,
        s = a1 + a2;
    cout << a1 << " + "
         << a2 << " = "
         << s << endl;
    return 0;
}
```
@LIA.cpp

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=%23include%20%3Ciostream%3E%0Ausing%20namespace%20std%3B%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20int%20a1%20%3D%204,%0A%20%20%20%20%20%20%20%20a2%20%3D%209,%0A%20%20%20%20%20%20%20%20s%20%3D%20a1%20%2B%20a2%3B%0A%20%20%20%20cout%20%3C%3C%20a1%20%3C%3C%20%22%20%2B%20%22%0A%20%20%20%20%20%20%20%20%20%3C%3C%20a2%20%3C%3C%20%22%20%3D%20%22%0A%20%20%20%20%20%20%20%20%20%3C%3C%20s%20%3C%3C%20endl%3B%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

## Esercizi

Risolvi gli esercizi e rispondi alle domande

### Esercizio 1 - Predict
Considera il seguente programma

``` c
#include <iostream>
using namespace std;
int main() {
    double raggio, circonferenza, area;
    const double pi = 3.14159;
    cout << "Inserisci il raggio del cerchio: ";
    cin >> raggio;
    circonferenza = 2 * pi * raggio;
    area = pi * raggio * raggio;
    cout << "La circonferenza è: " << circonferenza << endl;
    cout << "L'area è: " << area << endl;
    return 0;
}
```
@LIA.cpp

Quesito 1.1: Cosa farà questo programma se inserisco il valore 5 per il raggio?

Quesito 1.2: Cosa fa esattamente il codice sotto quando viene eseguito?

### Esercizio 2 - Predict
Considera il seguente programma

``` c
#include <iostream>
using namespace std;
int main() {
    int numero;
    cout << "Inserisci un numero: ";
    cin >> numero;
    if (numero % 7 == 0) {
        cout << "Il numero è divisibile per 7" << endl;
    } else {
	cout << "Il numero NON è divisibile per 7" << endl;
    }
    return 0;
}
```
@LIA.cpp

Quesito 2.1: Se inserisco il numero 28, cosa verrà stampato a schermo?

Quesito 2.2: E se inserisco 13?

Quesito 2.3: In generale, cosa fa questo programma?

Quesito 2.4: Termina sempre?


### Esercizio 3:  - Predict
Considera il seguente programma

``` c
#include <iostream>
using namespace std;
int main() {
    int num1, num2, num3 = 0;
    cout << "Inserisci due numeri: ";
    cin >> num1 >> num2;
    while (num2 > 0) {
        num3 = num3 + num1;
        num2--;
    }
    cout << "L'operazione tra " << num1 << " e " << num2 << " produce " << num3 << endl;
    return 0;
}
```
@LIA.cpp

Quesito 3.1: Quanto vale num3 quando inserisco i valori 2 e 0?

Quesito 3.2: Quanto vale num3 quando inserisco i valori 2 e 3?

Quesito 3.3: Cosa fa, in generale, questo programma, dati due numeri naturali qualsiasi?

Quesito 3.4: Termina sempre?

### Esercizio 4 - Predict

Considera il seguente programma

``` c
#include <iostream>
using namespace std;
int main() {
    int numero = 1, accumulatore = 1;
    const int fine = 10;
    do {
        accumulatore *= numero;
        numero++;
    } while (numero <= fine);
    cout<< accumulatore << endl;
    return 0;
}
```
@LIA.cpp

Quesito 4.1: Cosa stampa a video il programma?

Quesito 4.2: Quante volte si entra nel ciclo?

Quesito 4.3: Cosa fa, in generale, questo programma, considerando che fine potrebbe essere una variabile?

Quesito 4.4: Termina sempre?

### Esercizio 5 - Predict

``` c
#include <iostream>
using namespace std;
int main() {
    int accumulatore = 0;
    const int inizio = 10;
    const int fine = 20;
    for (int i = inizio; i <= fine; i++) {
        accumulatore += i;
    }
    cout << accumulatore << endl;
    return 0;
}
```
@LIA.cpp

Quesito 5.1: Cosa stampa a video il programma?

Quesito 5.2: Quante volte si entra nel ciclo?

Quesito 5.3: Cosa fa, in generale, questo programma, considerando che inizio e fine potrebbero essere due variabili?

Quesito 5.4: Termina sempre?


### Esercizio 6 - Modify

Considera il seguente frammento di codice da completare

``` c
#include <iostream>
using namespace std;
int main() {
    const int fine = …;
    int j = 0;

    for (int i = 0; i < fine; i++) {
        j++;
    }
    cout << j << endl;

    return 0;
}
```
@LIA.cpp

Quesito 6.1: Quale/i valori deve assumere la variabile fine affinché venga stampato 0?

Quesito 6.2: Quale valore devo assegnare a fine per far stampare 10?

### Esercizio 7 - Modify

Quesito 7.1: Modifica il programma dell’esercizio 2 per stampare “Pari” se il numero fornito in input è divisibile per due, “Dispari” altrimenti.

### Esercizio 8 - Modify

Quesito 8.1: Modifica il programma dell’esercizio 4 per ottenere la somma dei numeri naturali compresi tra 5 e 10, estremi inclusi

### Esercizio 9 - Make

Quesito 9.1: Scrivi un programma che chiede l’età e scrive “Maggiorenne” se l’età è maggiore o uguale a 18 anni, “Minorenne” altrimenti

### Esercizio 10 - Make

Quesito 10.1: Scrivi un programma che stampa a video 10 volte il tuo nome.
