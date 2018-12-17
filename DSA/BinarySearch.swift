/*
Chops array in half until you find the value you're looking for. Array needs to be sorted.
    -O(log n)
*/

let numbers = [1,4,6,7,10,12,18,19,23,34,44,58,65]

func binarySearch1(array: [Int], key: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        print("\(key) is not in the array")
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex + 1...maxIndex])
        return binarySearch1(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch1(array: slice, key: key)
    }
    
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    return false
}

func binarySearch2<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch2(a, key: key, range: range.lowerBound ..< midIndex)
            
        // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch2(a, key: key, range: midIndex + 1 ..< range.upperBound)
            
        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}

