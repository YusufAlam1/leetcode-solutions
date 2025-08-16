class Solution(object):
    def maximum69Number (self, num):
        num_list = []
        for digit in str(num):
            num_list.append(int(digit))

        for i in range(len(num_list)):
            if num_list[i] == 6:
                num_list[i] = 9
                break

        return int("".join(map(str, num_list)))