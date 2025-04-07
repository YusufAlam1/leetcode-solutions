#include <stdio.h>

int minCostClimbingStairs(int cost[], int length) {
    int totalCost[length + 1];

    // Cost to start at step 0 or step 1 is zero
    totalCost[0] = 0;
    totalCost[1] = 0;

    for (int i = 2; i <= length; i++) {

        // Option 1: take one step from (i - 1)
        int from1 = totalCost[i - 1] + cost[i - 1];

        // Option 2: take two steps from (i - 2)
        int from2 = totalCost[i - 2] + cost[i - 2];

        // Choose the cheaper option
        totalCost[i] = (from1 < from2) ? from1 : from2;
    }

    return totalCost[length];
}

int main() {
    int cost[] = {8, 30, 20};
    int length = sizeof(cost) / sizeof(cost[0]);

    int minCost = minCostClimbingStairs(cost, length);
    printf("Minimum cost to reach the top: %d\n", minCost);

    return 0;
}
