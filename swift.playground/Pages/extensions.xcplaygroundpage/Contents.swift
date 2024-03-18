//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Extensions are used to add new functionality to an already exixting class, sturcture, enum or protocols

//Extensions can add new functionality to a type, but they can’t override existing functionality.

//Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.


extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")


let totalLength = 2.4.km - 20.m

print("total length will be \(totalLength)")



//Extensions can add new convenience initializers to a class, but they can’t add new designated initializers or deinitializers to a class.

// Extention can add methods


extension Int {
    func repeatition(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repeatition {
    print("shdfi")
}


// mutating instance method -> which modify the value of self

extension String{
    mutating func greet(){
        self = "Hello " + self
    }
}

var name = "Aman"
name.greet()
print(name)


// Extension can add subscript
// Extension can add nested types

extension Int{
    enum TypeOfNum{
        case positive, negative, zero
    }
    
    var type: TypeOfNum {
        switch self {
        case 0:
            return .zero
        case let x where x < 0:
            return .negative
        default:
            return .positive
        }
    }
}

var ArrayOfInt = [-1,123,120,00,-12,-21]

var typeOfNum: [String] = []


for item in ArrayOfInt {

    print(item.type)
}

