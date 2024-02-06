//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Property
// data member of class, structure and enums are called property

// Stored Property
// simple data members which store value for class or structure

class StoredClass{
    var property1: Int
    var property2: String
    init(property1: Int, property2: String) {
        self.property1 = property1
        self.property2 = property2
    }
}

var instance = StoredClass(property1: 10, property2: "Ten")



// Lazy Stored property
// property which does not initialise until it is called/ accessed
// if a property takes a lot time to initialise and it is not used in every instace then we can create this property lazy
class LazyClass{
    var temp: Int
    lazy var date: Date = Date() // not initialise while creating object of class LazyClass
    
    init(temp: Int) {
        self.temp = temp
    }
}

var instanceOfLazyClass = LazyClass(temp: 14)
print(instanceOfLazyClass.date)



// computed property
// property which can be computed after initialisation
// a getter and an optional setter is defined to read and write the value

class Point{
    var x: Double
    var y: Double
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}


class Square{
    var origin: Point
    var side: Int
    
    var center: Point {
        get {
            let centerX = origin.x + Double(side)/2
            let centerY = origin.y + Double(side)/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set (newCenter) {
            origin.x = newCenter.x - Double(side)/2
            origin.y = newCenter.y - Double(side)/2
        }
    }
    
    init(origin: Point, side: Int) {
        self.origin = origin
        self.side = side
    }
}


var mySquare = Square(origin: Point(x: 0, y: 0), side: 4)
print(mySquare.center.y)
mySquare.center = Point(x: 0, y: 0)
print(mySquare.origin.y)


//Read-Only Computed Properties
// setter is not provided

extension Square{
    var area: Int {
        side * side
    }
}


print(mySquare.area)



// Property Observer
// willSet -> function that execute just before the updating the value of property
// didSet -> function that execute just after the updating the value of property

struct PersonDetails {
    var name: String = "aman" {
        willSet (newValue) {
            print("New value of name \(name) will be \(newValue)")
        }
        didSet (oldValue) {
            print("Old value of name \(name) was \(oldValue)")
        }
    }
    
    
}

var aman = PersonDetails(name: "aman")
aman.name = "aman sharma"


// property wrapper
// we can add some checks for any property and then can use in other struct/ class/ Enum

@propertyWrapper
struct SmallNumber {
    private var _number: Int
    // compited property
    var wrappedValue: Int{
        get {
            return isValid(number: _number) ? _number: -1
        }
        set {
            _number = newValue
        }
    }
    private func isValid(number: Int) -> Bool {
        return number <= 15
    }
    init(_number: Int) {
        self._number = _number
    }
}


struct SmallCube {
    @SmallNumber var width: Int
    @SmallNumber var height: Int
    @SmallNumber var length: Int
    var volume: Int {
        width * height * length
    }
    
//    init(width: Int, height: Int, length: Int) {
//        self.width = width
//        self.height = height
//        self.length = length
//    }
}

var TwoByThreeByFive = SmallCube(width: SmallNumber(_number: 2), height: SmallNumber(_number: 3), length: SmallNumber(_number: 5))

print(TwoByThreeByFive.volume)



// type property syntax
// static data members -> belongs to class or structure and not to each instance

class Students{
    var name: String
    let Id: Int
    var grade: Character
    static var count: Int = 0
    
    init(name: String, Id: Int, grade: Character) {
        self.name = name
        self.Id = Id
        self.grade = grade
        // for changing the value of static variable we must access it through ClassName.propertyName
        Students.count += 1
    }
    
//    static func incCount() {
//        count+=1
//    }
}


var s1: Students = Students(name: "Aman", Id: 101, grade: "O")
var s2: Students = Students(name: "Ahaan", Id: 102, grade: "A")
var s3: Students = Students(name: "Shaan", Id: 103, grade: "D")
var s4: Students = Students(name: "Kumar", Id: 104, grade: "E")

print(Students.count)
 
