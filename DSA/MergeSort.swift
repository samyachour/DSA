// Implement merge sort. Split first, merge after. Split all the way to single element then merge in steps keeping the aggregated arrays sorted.
class SolutionMerge {
    func mergeSort(_ array: [Int]) -> [Int] {
        
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
        return merge(leftArray, rightArray)
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray : [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            // challenge!
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
}
