/*
-Find the most common element in an array
*/

class SolutionCommon {
    
    func topKFrequent(nums: [Int], k: Int) -> [Int] {
        
        var valueCounts = [Int : Int]()
        var common = [Int]()
        
        // Create hash map of value counts
        for value in nums {
        
            if let count = valueCounts[value] {
                valueCounts[value] = count + 1
            } else {
                valueCounts[value] = 1
            }
        
        }
        
        // Create list from counts
        
        for (value, count) in valueCounts {
            
            if common.count == 0 {
                common.append(value)
                continue
            }
            
            if let index = common.firstIndex(where: { valueCounts[$0]! > count }) {
                common.insert(value, at: index)
            } else {
                common.append(value)
            }
            
        }

        common.reverse()
        return Array(common[0...k-1])
    }
    
}
