#include <stdio.h>

int maxProfit(int prices[], int length);

int main() {
    int prices[] = {8, 1, 6, 4, 7, 4};
    int length = sizeof(prices) / sizeof(prices[0]);

    int profit = maxProfit(prices, length);
    printf("Maximum Profit: %d\n", profit);

    return 0;
}

int maxProfit(int prices[], int length) {
    int minPrice = prices[0];
    int maxProfit = 0;

    for (int day = 1; day < length; day++) {
        if (prices[day] < minPrice) {
            minPrice = prices[day]; 
        } else if ((prices[day] - minPrice) > maxProfit) {
            maxProfit = prices[day] - minPrice;  // better sell day
        }
    }

    return maxProfit;
}
