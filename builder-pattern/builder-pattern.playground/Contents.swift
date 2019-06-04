
/*
 - LINK : https://viblo.asia/p/su-dung-builder-pattern-trong-swift-1Je5EdQmlnL
 */
import UIKit

class Car {
    var weel:Int?
    var color:String?
}

protocol CarBuilderProtocol {
    func build() -> Car
    func setWeel(weel:Int) -> CarBuilder
    func setColor(color:String) -> CarBuilder
}

class CarBuilder:CarBuilderProtocol{
    var car:Car
    
    init() {
        self.car = Car()
    }
    
    func build() -> Car{
        return car
    }
    
    func setWeel(weel: Int) -> CarBuilder {
        car.weel = weel
        return self
    }
    
    func setColor(color: String) -> CarBuilder {
        car.color = color
        return self
    }
}

class CarBuilderDirector{
    var builder:CarBuilder
    
    init(builder: CarBuilder) {
        self.builder = builder
    }
    
    func construct() -> Car {
        return builder.setWeel(weel: 4).setColor(color: "White").build()
    }
}

let builder = CarBuilder()
let carBuilderDirector = CarBuilderDirector(builder: builder)
let car = carBuilderDirector.construct()
car.weel = 5
print("Car weel: \(car.weel!), Car color: \(car.color!)") //result: "Car weel: 4, Car color: White"


