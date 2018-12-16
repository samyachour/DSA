/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

class Solution2Sum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var parts = [Int: Int]()
        
        for (idx, num) in nums.enumerated() {
        
            let complement = target - num
            
            if let compIdx = parts[complement] {
                
                return [idx, compIdx]
                
            } else {
                
                parts[num] = idx
                
            }
            
        }
        return [0,0]
    }
}
