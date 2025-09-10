from typing import List

class Solution:
    def sumZero(self, n: int) -> List[int]:
        if n % 2 == 0:
            lst = []
        else:
            lst = [0]
        for i in range(1, n//2+1):
            lst.append(-i)
            lst.append(i)
        return lst