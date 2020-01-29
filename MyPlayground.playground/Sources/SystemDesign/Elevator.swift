/*
 https://stackoverflow.com/questions/493276/modelling-an-elevator-using-object-oriented-analysis-and-design
 */

let maxFloors = 10
let capacity = 7

enum Direction {
    case up
    case down
    case stand
    case maintenance
}

class Elevator {
    
    private var direction = Direction.stand
    var publicDirection: Direction {
        get {
            return self.direction
        }
    }
    
    private var currentFloor = 1
    var publicCurrentFloor: Int {
        get {
            return self.currentFloor
        }
    }
    
    var load = 0
    private var floorRequests = [Int]()
    weak var parentBank : Bank?
    
    func addFloor(floor: Int) {
        if floorRequests.contains(floor) { return }
        if floorRequests.isEmpty { floorRequests.append(floor); return }
        
        if let index = floorRequests.index(where: { $0 > floor }) {
            floorRequests.insert(floor, at: index)
        }
    }
    
    func changeDirection(newDirection: Direction) {
        if direction == newDirection { return }
        direction = newDirection
        
        if newDirection == Direction.up {
            floorRequests.sort(by: <)
        } else if newDirection == Direction.down {
            floorRequests.sort(by: >)
        } else if newDirection == Direction.maintenance {
            openDoors()
            
            // Release all the floor requests to other elevators
            if let bank = parentBank {
                while !floorRequests.isEmpty {
                    bank.requestFloor(floor: floorRequests.removeFirst(), load: 1)
                }
            }
        }
    }
    
    func openDoors() {
        print("Opening doors...")
    }
    
    func closeDoors() {
        print("Closing doors...")
    }
    
    func releaseLoad() {
        openDoors()
        load -= 1 // Might want to make floorRequests a list of tuples with request + load pairs, incrementing the load every time a duplicate floor request is made and initializing at 1
        closeDoors()
    }
    
    func move() {
        if !floorRequests.isEmpty && currentFloor == floorRequests[0] {
            releaseLoad()
            floorRequests.removeFirst()
        }
        else if floorRequests.isEmpty {
            self.changeDirection(newDirection: Direction.stand)
        }
        
        if direction == Direction.up && currentFloor + 1 <= maxFloors {
            currentFloor += 1
        }
        else if direction == Direction.down && currentFloor - 1 >= 0 {
            currentFloor -= 1
        }
        else if direction == Direction.stand && !floorRequests.isEmpty {
            if currentFloor < floorRequests[0] { self.changeDirection(newDirection: Direction.up) }
            if currentFloor > floorRequests[0] { self.changeDirection(newDirection: Direction.down) }
            // Will never be equal because of the first if statement
        }
    }
    
}

class Bank {
    
    var elevators : [Elevator]
    var activeElevators : [Elevator] {
        get {
            return elevators.filter { $0.publicDirection != Direction.maintenance }
        }
    }
    
    init(elevators : [Elevator]) {
        self.elevators = elevators
    }
    
    func requestFloor(floor: Int, load: Int) -> Bool {
        
        // Elevators standing on this currrent floor
        var localElevs = activeElevators.filter { $0.publicDirection == Direction.stand && $0.publicCurrentFloor == floor }
        if localElevs.isEmpty {
            // Elevators heading to this floor
            localElevs = activeElevators.filter { ($0.publicDirection == Direction.up && $0.publicCurrentFloor < floor) || ($0.publicDirection == Direction.down && $0.publicCurrentFloor > floor)}
        }
        if localElevs.isEmpty {
            // Elevators standing on other floors
            localElevs = activeElevators.filter { $0.publicDirection == Direction.stand }
        }
        if localElevs.isEmpty {
            // Elevator with the lowest load
            localElevs = activeElevators.sorted(by: {$0.load < $1.load})
        }
        
        let localElev = localElevs[0]
        localElev.load += load
        localElev.addFloor(floor: floor)
        return true
        
    }
    
    func moveElevators() {
        for elevator in activeElevators {
            elevator.move()
        }
    }
}
