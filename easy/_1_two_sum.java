public class _1_two_sum {
    public static void main(String[] args) {
        int[] nums = {2, 7, 11, 5};
        int target = 9;

        int[] result = twoSum(nums, target);
        System.out.println("[" + result[0] + ", " + result[1] + "]");
    }

    public static int[] twoSum(int[] nums, int target) {
        int[] indexes = new int[2];

        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                if (nums[i] + nums[j] == target) {
                    indexes[0] = i;
                    indexes[1] = j;
                    return indexes;
                }
            }
        }

        return indexes; // default [0, 0] if not found (can be handled better too)
    }
}
