/*

 
 Given an array (for example, [ 1, 0, 2, 0, 0, 3, 4 ]), implement methods that
 
 1. returns the number of non-zero elements (4)
 2. moves the non-zero elements to the beginning of the array (the rest of the elements don't matter)
 -> both [ 1, 2, 3, 4, 0, 0, 0] and [ 4, 1, 3, 2, X, Y, Z ] are valid
 
*/

public class arrayHandler {
    
    public var array : [Any]
    
    init(array: [Any]) {
        self.array = array
    }
    
    public func nonZero() -> Int {
        var count = 0
        
        for element in array {
        
            if let elementInt = element as? Int {
                if elementInt != 0 {
                    count += 1
                }
            }
            
        }
        
        return count
    }
}
