//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// debugging
// assert(condition, message) -> on failure of condition the message will be printed
var age = 20
assert(age >= 18 , "Age should be greater than 18 to vote") // both condition and message
//assert(age >= 18 ) // only condition
//assertionFailure( "Age should be greater than 18 to vote") // if codition is validated by if else then only message


// precondition
// similar to assert
precondition(age > 0 , "Age must be positive")

// difference between assert and precondition is that precondition will be available in production mode but all assert statements will be ignored in production mode
