/*
 -Merge sort divides the lists into basic elements then merges them back sorted at each level's union
 */

func merge_(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var ordered = [Int]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            ordered.append(leftArray[leftIndex])
            leftIndex += 1
        } else if rightArray[rightIndex] < leftArray[leftIndex] {
            ordered.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            ordered.append(leftArray[leftIndex])
            leftIndex += 1
            ordered.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    
    
    while leftIndex < leftArray.count {
        ordered.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        ordered.append(rightArray[rightIndex])
        rightIndex += 1
    }
    
    return ordered
    
}

func mergeSort_(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let midIndex = array.count/2
    
    let left = mergeSort_(array: Array(array[0..<midIndex]))
    let right = mergeSort_(array: Array(array[midIndex...]))
    
    return merge_(leftArray: left, rightArray: right)
    
}
