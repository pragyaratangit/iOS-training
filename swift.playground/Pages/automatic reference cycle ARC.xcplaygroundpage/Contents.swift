//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// Swift uses Automatic Reference Counting (ARC) to track and manage your app’s memory usage.

// Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance.

// Additionally, when an instance is no longer needed, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead.

// To make sure that instances don’t disappear while they’re still needed, ARC tracks how many properties, constants, and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.

class Person {
    var name: String
    var apartment: Apartment?
    var house: House?
    init(name: String) {
        self.name = name
        print("init is called \(name)")
    }
    
    deinit {
        print("Deinit is called \(name)")
    }
}

// as they are optional variable , automatically initialised with nil
var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person(name: "Pragya")
person2 = person1
person3 = person1

// although person1 and person2 are nill now but still deinit will not called
person1 = nil
person2 = nil

// now all strong reference are broken
//person3 = nil





// Strong Reference Cycle
//it’s possible to write code in which an instance of a class never gets to a point where it has zero strong references. This can happen if two class instances hold a strong reference to each other, such that each instance keeps the other alive. This is known as a strong reference cycle.


class Apartment{
    let unit: String
    init(unit: String) { self.unit = unit }
    
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


var aman: Person?
var unit5A: Apartment?

aman = Person(name: "Aman")
unit5A = Apartment(unit: "5A")

// now has a reference to unit5A apartment and unit5A apartment has a reference to Aman
// the optional chaining is used because Aman and unit5A are optional variables

aman!.apartment = unit5A
unit5A!.tenant = aman

// now if we assign nil to aman and unit5A  no deiniti will called
//aman = nil
unit5A = nil

// as apartment and person make a strong reference cycle
// to break this we have 2 approaches
// break mannually
//aman?.apartment = nil
//unit5A?.tenant = nil


// declare one reference as weak

class House{
    let unit: String
    init(unit: String) { self.unit = unit }
    // declaring tenant as weak will break the cycle as soon as tenant will become nil
    weak var tenant: Person?
    deinit { print("house \(unit) is being deinitialized") }
}

var house1A: House?
house1A = House(unit: "1A")
aman = Person(name: "aman")
aman?.house = house1A
house1A?.tenant = aman

// as house holds a weak reference to person so
// by making person nill will break the SRC
aman = nil
house1A = nil

// weak can only used by class property which can be nil at some point of thier life(optional)



// Unowned References
// used when we are sure that instance will always has a value
// an unowned reference is used when the other instance has the same lifetime or a longer lifetime.

class User{
    var name:String
    var device: Device?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("User \(name) is deinitialise")
    }
}

class Device{
    var name: String
    unowned var user: User
    init(name: String, user: User) {
        self.name = name
        self.user = user
    }
    
    deinit {
        print("Device \(name) is deinitialise")
    }
}

var pragya: User?
pragya = User(name: "Pragya")
pragya!.device = Device(name: "Mobile", user: pragya!)




var laptop: Device?

laptop = Device(name: "laptop", user: pragya!)
// previous device(mobile) will deinitialise due to this
pragya!.device = laptop

// now laptop will not deinit as it has strong ref to laptop variable in line 152
pragya!.device = nil



// unowned optional reference
// same as unowned but here we can set variable to nil


class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
    
    deinit {
        print("deparment \(name)")
    }
}


class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    
    deinit {
        print("course \(name)")
    }
}

// here department has a strong reference to course
// course has an unowned reference to department
// course has an unowned reference to course


var computer:Department = Department(name: "Computer")
let basic = Course(name: "basic-C", in: computer)
let medium = Course(name: "medium-C", in: computer)
let advance = Course(name: "advance-C", in: computer)


basic.nextCourse = medium
medium.nextCourse = advance

computer.courses = [basic, medium, advance]

// no strong reference is there to computer so setting it to nil will deinitialize all memory
//computer = nil


//The Person and Apartment example shows a situation where two properties, both of which are allowed to be nil, have the potential to cause a strong reference cycle. This scenario is best resolved with a weak reference.

//The Customer and CreditCard example shows a situation where one property that’s allowed to be nil and another property that can’t be nil have the potential to cause a strong reference cycle. This scenario is best resolved with an unowned reference.

//However, there’s a third scenario, in which both properties should always have a value, and neither property should ever be nil once initialization is complete. In this scenario, it’s useful to combine an unowned property on one class with an implicitly unwrapped optional property on the other class.


// Unowned References and Implicitly Unwrapped Optional Properties
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        // capitalCity is nil initially so Country is fully initialised after setting its name property
        self.capitalCity = City(name: capitalName, country: self)
    }
}

// Country holds a weak reference to city
class City {
    let name: String
    unowned let country: Country
       init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
//All of this means that you can create the Country and City instances in a single statement, without creating a strong reference cycle, and the capitalCity property can be accessed directly, without needing to use an exclamation point to unwrap its optional value

var India = Country(name: "India", capitalName: "Delhi")
print("Country name \(India.name) and capital is \(India.capitalCity.name)")



//Strong Reference Cycles for Closures
//A strong reference cycle can also occur if you assign a closure to a property of a class instance, and the body of that closure captures the instance. This capture might occur because the closure’s body accesses a property of the instance, such as self.someProperty, or because the closure calls a method on the instance, such as self.someMethod().

class HTMLElement {


    let name: String
    let text: String?


    lazy var asHTML: () -> String = {
//        [unowned self] in // this will make weak reference and breaks the SRC
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }


    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }


    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())


// a strong reference cycle will be created between paragraph and closure
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil  // no use as instance is already captured by closure


// Resolving Strong Reference Cycles for Closures
// defining capturing list
/*
lazy var someClosure = {
 // all variable are marked with unowned or weak and also included between square brackets separated by commas
        [unowned self, weak delegate = self.delegate]
        (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
*/


