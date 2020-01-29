/*
 LIFO, can pop off the top or push onto it as well as peeking
 
 */


class StackImp {
    
    private var array = [Int]()
    
    var last : Int {
        return array.count - 1
    }
    
    func push(val: Int) {
        array.append(val)
    }
    
    func pop() -> Int {
        return array.remove(at: last)
    }
    
    func peek() -> Int {
        return array[last]
    }
    
}
