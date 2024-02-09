//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Generics
//Write code that works for multiple types and specify requirements for those types.


func swapTwoInt(a: inout Int, b: inout Int) {
    let c = a
    a = b
    b = c
}
func swapTwoString(a: inout String, b: inout String) {
    let c = a
    a = b
    b = c
}
func swapTwoDouble(a: inout Double, b: inout Double) {
    let c = a
    a = b
    b = c
}

//we dont need to create multiple functions each for different type


// we can use generics

func swapTwoValue<T>(a: inout T, b: inout T){
    let c = a
    a = b
    b = c
}

var str1 = "helllo"
var str2 = "hey"

swapTwoValue(a: &str1, b: &str2)
print(str1, str2)


// type constraints
//T must be inherited from SomeClass and U must conform to the SomeProtocol
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
*/


// Associated type
//in protocol we mark variable as associatedtype and later decide their type

protocol GenericProtocol{
    associatedtype  prp1
}

class GenericClass: GenericProtocol {
    typealias prp1 = Int // now prp1 will be of type Int
}
