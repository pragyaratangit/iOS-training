//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// debugging
// assert(condition, message) -> on failure of condition the message will be printed
var age = 20
assert(age >= 18 , "Age should be greater than 18 to vote") // both condition and message
//assert(age >= 18 ) // only condition

// assertionFailure( "Age should be greater than 18 to vote") // if codition is validated by if else then only message


// precondition
// similar to assert
precondition(age > 0 , "Age must be positive")

// difference between assert and precondition is that precondition will be available in production mode but all assert statements will be ignored in production mode

//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Some part of code can give error
// to handle those error we have 4 ways

// 1. Propagating error using throwing function



enum myErrors: Error {
    case nameError(name: String)
    case ageErrro
    case passwordError
}


struct Details{
    var name: String
    var age: Int
    var password: String
    
    
    func printDetails() throws  {
        guard name.hasPrefix("a") else {
            throw myErrors.nameError(name: self.name)
        }
        
        guard age > 15 else {
            throw myErrors.ageErrro
        }
        
        guard password.count >= 8 else {
            throw myErrors.passwordError
        }
        
        print("All details are correct")
    }
}



var myDetails = Details(name: "Pragya", age: 111, password: "abc@1237")



do {
    try  myDetails.printDetails()
}
catch myErrors.nameError(let name) where name == "Pragya" {
    debugPrint("Error occured due to incorrect name \(name)")
}
catch myErrors.ageErrro , myErrors.passwordError {
    print("error is due to age or password")
}


// converting error into optional values
// using try?

enum pointError: Error {
    case lessThanTen
    case moreThanFifty
}
func pointFun(x: Int) throws -> Int {
    
    if x < 10 {
        throw pointError.lessThanTen
    }
    if x > 50 {
        throw pointError.moreThanFifty
    }
    return x*x
}

// using try?
if let square = try? pointFun(x: 13) {
    print(square)
}
else {
    print("number is not in range")
}


//Disabling Error Propagation
let square = try! pointFun(x: 11)
print(square)



// specifying cleanup actions
// using defer keyword we can write some code which will execute after ending function no matter how the function is closed (due to error or return / break)

enum idError: Error {
    case inValidId
}
func deferFun(id: Int) throws  {
    if id != 10 {
        throw idError.inValidId
    }
    
    defer {
       print("defer block is called")
    }
    
    print("function's end")
}

do{
    try deferFun(id: 10)
}
catch {
    print("Error occured \(error)")
}
