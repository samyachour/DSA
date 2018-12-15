/*
 -Given an array of integers and an integer target, return the indices of two numbers that add up to the target.
    -Can discard numbers that are already greater than the target
    -If there are no zeroes, can discard numbers equal to that target
    -if there are no 1's, can discard numbers equal to target - 1
 */

func twoSum (array: [Int], target: Int) -> (Int, Int)? {
    
    // Store the numbers and their index
    var parts = [Int : Int]()
    
    for (index, number) in array.enumerated() {
        
        let complement = target - number
        
        if let complementIndex = parts[complement] {
            
            return (complementIndex, index)
            
        }
        
        parts[number] = index
        
    }
    
    return nil
}
