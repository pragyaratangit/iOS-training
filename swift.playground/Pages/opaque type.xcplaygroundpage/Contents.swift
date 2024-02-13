//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//An opaque type lets the function implementation pick the type for the value it returns in a way that’s abstracted away from the code that calls the function.
protocol SomeProtocol {
    associatedtype MyType
    var p1:MyType {get set}
}


class Class1: SomeProtocol {
    var p1:Int = 100
}
class Class2: SomeProtocol {
    var p1:Int = 200
}



// SomeProtocol uses associated type
// Class1 and Class2 both conforms to SomeProtocol
// someFun funtion will confuse wheather return an object of Class1 or Class2
// so its required to use opaque type
// now function can return any class that conforms to SomeProtocol
func someFun(flag: Bool) ->some SomeProtocol {
    return flag ? Class1() : Class1()
}
someFun(flag: false)



// Example
protocol Shape {
    func draw() -> String
}


struct Triangle: Shape {
    var size: Int
    func draw() -> String {
       var result: [String] = []
       for length in 1...size {
           result.append(String(repeating: "*", count: length))
       }
       return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())


struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())


struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
       return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())


struct Square: Shape{
    var size: Int
    
    func draw() -> String {
        var results: [String] = []
                   
        for _ in 1...size {
            results.append(String(repeating: "*", count: size))
        }
        return results.joined(separator: "\n")
    }
}

var sizeThreeSquare = Square(size: 3).draw()
print(sizeThreeSquare)


// returning opaque type

func makeTrapezoid() ->  some Shape {
    let top = Triangle(size: 4)
    let middle = Square(size: 4)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())



//Boxed types involve wrapping a value in a container or box. This container introduces an additional layer, providing a common interface for various types.
//This can be beneficial in scenarios where you need to work with different types uniformly or when dealing with value semantics.

// by writing any we allow this array to hold any object of class and structure that conforms to Shape protocol

var arrayOfShapes: [any Shape] = []
arrayOfShapes.append(trapezoid)

