/*
 -Given an array of numbers:
    -Put the numbers in an unsorted pile
    -Pick a number from the pile (preferably the top)
    -Insert this number into a new array
    -Pick the next number from the pile and insert it in a proper sorted position
    -Keep doing this until your pile is empty
 -Can do the whole process in place w/ just the given array
 -Runtime of O(n^2) because of the nested loops
*/

func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && isOrderedBefore(a[y],a[y - 1]) {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

func insertionSortNoSwaps<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}
