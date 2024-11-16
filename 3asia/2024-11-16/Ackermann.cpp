/**
A(m, n) =
 \begin{cases}
 n+1 & \mbox{se } m = 0 \\
 A(m-1, 1) & \mbox{se } m > 0 \mbox{ e } n = 0 \\
 A(m-1, A(m, n-1)) & \mbox{se } m > 0 \mbox{ e } n > 0.
 \end{cases}
*/

#include <iostream>
using namespace std;

int Ackermann(int m, int n) {
    if (m == 0)
        return n + 1;
    if (m > 0 && n == 0)
        return Ackermann(m-1, 1);
    return Ackermann(m-1, Ackermann(m, n-1));
}

int main() {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            cout << "Ackermann("
                 << i << ", " << j << ")"
                 << " = " << Ackermann(i, j)
                 << "\n";
            }
    }

    return 0;
}
