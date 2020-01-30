/*
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */

class SolutionLongestSubstring {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var start = 0
        var maxLength = 0
        var usedChar = [Character : Int]()
        
        for (i, char) in s.enumerated() {

            // If character in usedChar, start is that character index + 1
            if let val = usedChar[char], start <= val {
                // Go to the character after our last duplicate
                start = val + 1
            } else { // Update maxLength
                maxLength = max(maxLength, i - start + 1)
            }
            // Update usedChar
            usedChar[char] = i
        }
        
        return maxLength
    }
    
    func lengthOfLongestSubstringBad(_ s: String) -> Int {
        if s.count == 1 {
            return 1
        }
        
        var overallSet = Set<Character>()
        var tempSet = Set<Character>()
        
        for char in s {
            
            if tempSet.contains(char) && tempSet.count > overallSet.count {
                overallSet = tempSet
                tempSet.remove(char)
            } else {
                tempSet.insert(char)
            }
            
        }
        
        return max(overallSet.count, tempSet.count)
        
    }
}
