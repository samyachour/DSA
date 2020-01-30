/*
 
 */

func isPalindrome(_ x: Int) -> Bool {
    var y = x
    guard x >= 0 else { return false }
    
    var result = 0
    while y != 0 {
        result *= 10
        result += y % 10
        y /= 10
    }
    
    return result == x
}
