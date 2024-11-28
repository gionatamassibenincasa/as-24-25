#include <iostream>
#include <string>
using namespace std;

struct Account {
    string username;
    string password;
};

const int N = 5;
Account as[N] = {
    { "micky", "minnie" },
    { "minnie", "topolino"},
    { "clarabella", "muuuu" },
    { "pluto", "bau"},
    { "paperino", "quack" }
};
Account a { "micky", "minnie" };

string login(Account &a, Account as[], int n) {
    for (int i = 0; i < n; ++i) {
        if (a.username == as[i].username &&
            a.password == as[i].password)
                return "Login!";
    }
    return "Impossibile eseguire l'accesso";
}

int main() {
    cout << "username: ";
    cin >> a.username;
    cout << "password: ";
    cin >> a.password;

    cout << login(a, as, N) << "\n";
    
    return 0;
}
