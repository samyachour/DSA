/*

 
 Given an array (for example, [ 1, 0, 2, 0, 0, 3, 4 ]), implement methods that
 
 1. returns the number of non-zero elements (4)
 2. moves the non-zero elements to the beginning of the array (the rest of the elements don't matter)
 -> both [ 1, 2, 3, 4, 0, 0, 0] and [ 4, 1, 3, 2, X, Y, Z ] are valid
 
*/

public class arrayHandler {
    
    public var array : [Any]
    public var nonZeroes : Int {
        return array.reduce(0) {(result,next) -> Int in
            return result + (isNonZero(val: next) ? 1 : 0)
        }
    }
    
    init(array: [Any]) {
        self.array = array
    }
    
    func isNonZero(idx: Int) -> Bool {
        
        if let value = array[idx] as? Int, value != 0 {
            return true
        }
        return false
        
    }
    
    func isNonZero(val: Any) -> Bool {
        
        if let value = val as? Int, value != 0 {
            return true
        }
        return false
        
    }
    
    public func moveZeroes() {
        if array.count == 1 {
            return
        }
        
        var index = array.count - 1
        var ordered = true
        
        while true {
            
            if isNonZero(idx: index) && !isNonZero(idx: index - 1) {
                
                array.swapAt(index, index - 1)
                ordered = false
                
            }
            
            index -= 1
            if index == 0 {
                index = array.count - 1
                if ordered { break } else { ordered = true }
            }
            
        }
        
    }
    
    public func moveZeroesUnordered() {
        
        var idx1 = 0
        var idx2 = array.count - 1
        
        while idx1 != idx2 {
            
            if isNonZero(idx: idx1) {
                idx1 += 1
            }
            if !isNonZero(idx: idx2) {
                idx2 -= 1
            }
            if !isNonZero(idx: idx1) && isNonZero(idx: idx2) {
                array.swapAt(idx1, idx2)
                idx1 += 1
                idx2 -= 1
            }
            
        }
        
    }
    
    func moveZeroesFaster() {
        
        var idx = 0
        var added = 0
        while idx < array.count - added {
            
            if array[idx] as! Int == 0 {
                
                array.append(array[idx])
                array.remove(at: idx)
                added += 1
                
            } else {
                idx += 1
            }
        }
        
    }
}
