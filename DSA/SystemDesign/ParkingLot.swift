/*
 
 -Parking lot with spots, vehicles
 -Has 3 different sized spots
 
 */

enum spotSize {
    case compact
    case average
    case large
}

enum vehicleColor {
    case white
    case black
    case green
    case red
    case blue
    case yellow
}

enum carType {
    case hatchback
    case sedan
    case truck
    case SUV
}

protocol Vehicle {
    
    var licensePlate: String {get}
    var color: vehicleColor {get}
    var size: spotSize {get}
    
}

struct Car: Vehicle {
    
    let licensePlate: String
    let color: vehicleColor
    let size: spotSize
    var type: carType?
    
    init(licensePlate: String, color: vehicleColor, size: spotSize) {
        self.licensePlate = licensePlate
        self.color = color
        self.size = size
    }
}

struct Spot {
    
    let size: spotSize
    let ID: Int
    var vehicle: Vehicle?
    
    init(size: spotSize, id: Int) {
        self.size = size
        self.ID = id
    }
    
}

class ParkingLot {
    
    // Stacks of open spots
    var compactSpots = Stack(array: [Spot(size: spotSize.compact, id: 0)])
    var averageSpots = Stack(array: [Spot(size: spotSize.average, id: 1)])
    var largeSpots = Stack(array: [Spot(size: spotSize.large, id: 2)])
    
    var occupiedSpots = [Int: Spot]()
    
    init(spots: [Spot]) {
        compactSpots.pop()
        averageSpots.pop()
        largeSpots.pop()
        
        for spot in spots {
            occupiedSpots[spot.ID] = spot
            switch spot.size {
            case .compact:
                compactSpots.push(new: spot)
            case .average:
                averageSpots.push(new: spot)
            case .large:
                largeSpots.push(new: spot)
            }
        }
    }
    
    func placeVehicle(vehicle: Vehicle) -> Spot? {
        
        switch vehicle.size {
        case .compact:
            guard var spot = compactSpots.pop() ?? averageSpots.pop() ?? largeSpots.pop() else {
                fallthrough
            }
            
            spot.vehicle = vehicle
            occupiedSpots[spot.ID] = spot
            
            return spot
        case .average:
            guard var spot = averageSpots.pop() ?? largeSpots.pop() else {
                fallthrough
            }
            
            spot.vehicle = vehicle
            occupiedSpots[spot.ID] = spot
            
            return spot
        case .large:
            guard var spot = largeSpots.pop() else {
                fallthrough
            }
            
            spot.vehicle = vehicle
            occupiedSpots[spot.ID] = spot
            
            return spot
        default:
            return nil
        }
        
    }
    
    func removeVehicle(spotID: Int) -> Vehicle? {
        
        guard var spot = occupiedSpots[spotID] else {
            return nil
        }
        
        let vehicle = spot.vehicle
        spot.vehicle = nil
        
        switch spot.size {
        case .compact:
            compactSpots.push(new: spot)
            occupiedSpots.removeValue(forKey: spotID)
        case .average:
            averageSpots.push(new: spot)
            occupiedSpots.removeValue(forKey: spotID)
        case .large:
            largeSpots.push(new: spot)
            occupiedSpots.removeValue(forKey: spotID)
        }
        
        return vehicle
        
    }
    
}
