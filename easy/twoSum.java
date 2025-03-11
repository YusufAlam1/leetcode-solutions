package leetcode;

public class twoSum {
    
    public static void main(String[] args)
    {
        int[] nums = {2,7,11,5};
        int target = 9; 

        int[] result = twoSum(nums, target);

        System.out.println("["+result[0]+","+result[1]+"]");
    }

    public static int[] twoSum(int[] nums, int target) 
    {   
        int[] indexes = new int[2];

        for (int j = 0; j < nums.length; j++) 
        {
            for(int i = 0; i < nums.length; i++)
            {
                if((target - nums[i] - nums[j]) == 0 && i != j)
                {
                    System.out.printf("[%d,%d]",nums[i], nums[j]);
                    indexes[0] = i;
                    indexes[1] = j;
                    
                }
            }
        }
    return indexes;   
    }
}
