class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        drink = numBottles
        drank = numBottles
        while (drank >= numExchange):
            drink += drank // numExchange
            drank = drank % numExchange + (drank // numExchange)
        return drink