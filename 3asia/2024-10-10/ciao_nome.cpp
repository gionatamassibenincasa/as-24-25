// file: ciao_nome.cpp
// Questo programma stampa a video il messaggio "Ciao, Mondo!"
#include <iostream>
#include <string>

int main() {
		std::string nome;
		std::cout << "Come ti chiami? ";
		std::cin >> nome;
		std::cout << "Ciao, " << nome << "!\n";

    return 0;
}
