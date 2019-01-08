/*
 
 */


func reverse(_ x: Int) -> Int {
    
    var rev = 0
    var y = x
    
    while y != 0 {
        rev *= 10
        rev += y % 10
        y = y / 10
        
    }
    
    if rev > 2147483647 || rev < -2147483648 { return 0 }
    
    return rev
}
