//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// loops
for i in 0..<10 {
    print(i)
}


for _ in 0..<5 {
    print("repeated")
}

// stride allow us to icrease or decrease element by custom value
for i in stride(from: 10, through: -10, by: -2) {
    print(i)
}


// while loops
var i = 0
while true {
    print("condition is true")
    i+=3
    if i >= 10 {
        break
    }
}


// repeat while
// execute code atleast once
repeat {
    print("in repeat while loop")
    i-=2
    if( i < 0 ){
        break
    }
        
}
while true




// conditional statements
// simple if-else

// we can assign value of if- else in variable

let someVar: String? = if 4 > 5 {
    "four is greater than five"
}
else if 4 == 5 {
    "four is equal to five"
}
else{
    nil
}

print(type(of: someVar))

// will cover this in error handling
//let error = if 4 > 5 {
//    throw "Four is less than five"
//}
//else{
//    "works fine"
//}
//
//print(error)



// switch

// instead of multiple is-else ladder we can use it

let key = "x"

switch key {
case "a","o":
    print("key is niether a nor o")
case "b":
    print("key is not b")
case "x":
    print("key matched to x")
    
default:
    print("no key matched")
}

// same as if-else we can store value of switch in a variable
// intervals (ranges) can also matched using switch
// case 0..<100



let cord = (-1,1)

let statement = switch cord {
case (0,0):
    "point is at origin"
case (_,0):
    "point is at x-axes"
case (0,_):
    "point is at y-axes"
case (-2...2,-2...2):
    "\(cord) point is inside square of side length 2 and center at origin"
default:
    "\(cord) Point is outside reach"
}

print(statement)


// value binding

//let cord = (-1,1)
switch cord {
case (let x, 1), (1, let x):
    print("point \(cord) with \(x)")
//case (1,let y):
//    print("point \(cord)")
default:
    print("default case")
}


//we can add condition in case using where

switch cord {
case let (x, y) where x == -y :
    print("x is equal to minus y")
case let (x, y) where x == y :
    print("x is equal to y")
default:
    print("default case")
}


let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


//Control Transfer Statements
//continue, break, fallthrough, return, throw


// continue => skips the current iteration
// break => stops the execution of loop
// fallthrough => make switch to execute next case also if current case is matched
// return => stops the execution of code and control goes to calling function
// throw => stops execution and throw an error


// guard
// syntax => guard <contition> else{ // code ; return }
// must be used in function or loops

func helloWorld(nam: String?){
    guard let name = nam else {
        print("no name is provided")
        return
    }
    print("hello world this is \(name)")
}
helloWorld(nam: nil)


// defer => code inside this will run before leaving the if block

if 4 < 5 {
    // prints after compliting if
    defer{
        print("hey this is aman")
    }
    print("4 is less than 5")
}

// #available => checks availablity of api
if #available(iOS 100, *){
    print("api is available")
} else{
    print("api is not available")
}
