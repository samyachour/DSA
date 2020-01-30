/*
 Shuffle a set of numbers without duplicates.
 
 Example:
 
 // Init an array with set 1, 2, and 3.
 int[] nums = {1,2,3};
 Solution solution = new Solution(nums);
 
 // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
 solution.shuffle();
 
 // Resets the array back to its original configuration [1,2,3].
 solution.reset();
 
 // Returns the random shuffling of array [1,2,3].
 solution.shuffle();
 
 /**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
 
 */

class SolutionShuffle {
    
    var nums : [Int]
    var shuffledNums = [Int]()
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var numCopy = nums
        var index : Int
        shuffledNums = []
        var length = numCopy.count
        
        while numCopy != [] {
            index = Int.random(in: 0..<length)
            shuffledNums.append(numCopy[index])
            numCopy.remove(at: index)
            length -= 1
        }
        
        return shuffledNums
    }
}

