#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

int64_t tribonacci(int n)
{
    int64_t trib[n + 1];

    trib[0] = 0;
    trib[1] = 1;
    trib[2] = 1;

    for (int i = 3; i <= n; i++)
    {
        trib[i] = trib[i - 1] + trib[i - 2] + trib[i - 3];
    }

    return trib[n];
}

int main()
{
    int n = 40;

    int64_t result = tribonacci(n);

    printf("Tribonacci at n = %d: %" PRId64 "\n", n, result);
}