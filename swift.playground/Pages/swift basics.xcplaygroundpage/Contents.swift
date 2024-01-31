//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
import Foundation

// variable and constants

let name = "Pragyaratan" // let(constant) can not change its value
var age = 21            // variable can change its value


//Type Annotations
//while declaring variable defining its type

var first: String
let num: Double

// variables name can use anycharacter but should not start with numerical
var ab12 = "temp"
//var 12ab = "Not allowed"

// variables can be of type
// Int, Float, Double, String, Character
var char: Character = "b"

// type aliases
// we can rename already exist names of types
typealias MyInt = Int
var newInt: MyInt = 17
print(type(of: newInt))


//Booleans (true or false)
var flag: Bool = true
var env: String
if flag {
    env = "Developer"
}
else{
    env = "Production"
}
print(env)


// tuples => (different type of elements in one collection)
// number of elements and their type is fixed and can only defined at the compile time
var myTuple = ("pragyaratan", 21, 100)
let (nameP, ageP , _) = myTuple
print(nameP, ageP)
print(myTuple.1, myTuple.0, myTuple.self)



// optionals
// if we are not sure that variable will have value or not thne we can define it as optional
// use '?' after type name
// default value for such variables is nil
var optionalInt: Int? = 10

if optionalInt != nil {
    print("value of optionalInt is not nil")
}
else{
    print("value of optionalInt is nil")
}

// optional binding
// unwrapping optional value in variable named value
if let value = optionalInt {
    print("value of optionalInt is \(value)")
}
else{
    print("value of optionalInt is nil")
}


// shorthand
if  let optionalInt {
    print("value of optionalInt is \(optionalInt)")
}
else{
    print("value of optionalInt is nil " )
}

// we can bind mutiple optional in one if statement just like nested if statements
if let firstVal = Int("15") , let secondVal = Int("23") , firstVal > 10 && secondVal < 30 {
    print("\(firstVal) > 10 && \(secondVal) < 30")
}
else{
    print("error")
}

// fallback ( default value of variable contains nil)
// using double question mark we can give default value to optional
var frndName: String? = "aman"

print("Hey guys this is " + (frndName ?? "friend") )

// force unwrapping
// should only use when we are sure that optional will contain value


let number = Int("13")

let unWrappedNum = number! // by using '!' we can forcefully unwrap the optional

print(unWrappedNum)
// we can also use guard to force unwrapping
guard let unWrapNum = number else{
     fatalError("Error in unwrapping")
}
print(unWrapNum)


// implicit unwrapping
var str: String! = nil
str = "HAHA"
var s:String = str         // in case of implicit unwrapping
var frn:String = frndName! // in case of explicit unwrapping

print(s)

if let st = str {
    print(st)
}


