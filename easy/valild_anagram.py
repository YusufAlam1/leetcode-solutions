class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        sortS = "".join(sorted(s))
        sortT = "".join(sorted(t))

        if(sortS == sortT):
            return True
        return False