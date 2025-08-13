class Solution {
    public boolean isPowerOfTwo(int n) {
        for(int i = 0; n >= Math.pow(2, i); i++) {
            if(n == Math.pow(2, i)) {
                return true;
            }
        }
        return false;
    }
}