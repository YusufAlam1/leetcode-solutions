#include <stdio.h>

int search(int* nums, int numsSize, int target)
{
    int i;
    int count = 0;
    int lowerBound = 0;
    int upperBound = numsSize - 1;

    while(lowerBound <= upperBound)
    {
        i = (lowerBound + upperBound) / 2;  
        count++;

        if(nums[i] > target)
        {
            upperBound = i - 1;
        }
        else if(nums[i] < target)
        {
            lowerBound = i + 1;
        }
        else{
            return i;
        }
    }
    return -1;
}

int main()
{
    int nums[] = {-2,0,3,7,12};    
    int target = 2;
    int numsSize = (sizeof(nums) / sizeof(nums[0]));

    int result = binSearch(nums, numsSize, target);

    printf("Target %d, located at position %d\n", target, result);
}