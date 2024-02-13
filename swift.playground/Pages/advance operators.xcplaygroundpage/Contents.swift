//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Bitwise operators
// bitwise not => reverse all bits
let number: UInt8 = 0b00001111
let reverseNum = ~number  // equals 11110000

// bitwise and -> 1 if both bits are 1 otherwise 0
let a: UInt8 = 0b11111100
let b: UInt8  = 0b00111111
let aANDb = a & b  // equals 00111100

// bitwise or -> 0 if both bits are 0 else 1
let p: UInt8 = 0b10110010
let q: UInt8 = 0b01011110
let pORq = p | q  // equals 11111110

// bitwise xor -> 1 if both bits are different and 0 if both bits are same
let i: UInt8 = 0b00010100
let j: UInt8 = 0b00000101
let iXORj = i ^ j  // equals 00010001


let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000 // left shift by 1 bit
shiftBits << 2             // 00010000 // left shift by 2 bits
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000 // left shift by 6 bits ( true bit goes out if bound)
// right shift
shiftBits >> 2             // 00000001

// shifting for unsigned int
// space is filled by signed bit
// if negative (signed bit 1) then in right shift extra 1's are added
// in case of positive (signed bit 0) then in right shift extra 0's are added


//Overflow Operators

var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0

unsignedOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow is now equal to 255

// max &+ num => min + num -1
// min &- num => max - num + 1



//Operator Methods

struct Complex {
    var a = 0.0, b = 0.0
    
    func desc() {
        print("\(a) + i\(b)")
    }
}


extension Complex {
    static func + (left: Complex, right: Complex) -> Complex {
       return Complex(a: left.a + right.a, b: left.b + right.b)
    }
}


