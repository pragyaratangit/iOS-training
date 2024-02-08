//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// converting one type to another


class A{
    var a:Int
    init(a: Int) {
        self.a = a
    }
}

class B: A{
    var b: Int
    init(b: Int) {
        self.b = b
        super.init(a: 1)
    }
}

class C: A{
    var c: Int
    init(c: Int) {
        self.c = c
        super.init(a: 2)
    }
}

var array = [A(a: 10), A(a: 20), B(b: 100), B(b: 200), C(c: 1000), C(c: 2000)]

// checking type using 'is' operator
for item in array {
    if item is B {
        print("Item is of type B")
    }
    else if item is C {
        print("Item is of type C")
    }
}


// Downcasting
// cheching is object of superclass is of type of subclass

for item in array {
    if let item = item as? B {
        print("type B")
    }
    else if let item = item as? C {
        print("type C")
    }
}


// type Any can be of aby type
var things: [Any] = []


things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })

// using optional type
// No warning
let optionalNumber: Int? = 8
things.append(optionalNumber)        // Warning
things.append(optionalNumber as Any)




for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    
    default:
        print("something else")
    }
}



