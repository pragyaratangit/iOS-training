//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// operators

// assignment operator
// '='

let a = 10
let b = a // assigning value of a to b

let tuple = ("Hey", "Aman", 123)
var anotherTuple = ("a", "b", 1)
anotherTuple = tuple

print(anotherTuple)


// arithmetic operators
// + , - , * , / , %


let sum = a + b
let diff = a - b
let prod = a * b
let quotient = a / b
let remainder = a % b

// a%b = a%(-b)
//let r = a % (-b)

// add (+) can work on strings also
let strA = "Hey"
let strB = "Byy"

let merge = strA + " " + strB
print(merge)


// unary minus and unary plus
var num = 10
var minusNum = -num
print(minusNum)
var plusNum = -minusNum
print(plusNum)

// compound assignment

num += b
minusNum -= prod
print(num, minusNum)



// comparison operator
// == , != , < , > , <= , >=
// returns a boolean value
// used in if condition statement
// can compare any type accept boolean
// fopr comparing tuples must hold comparable values
("123", 1234) < ("hey", 1234) // return true becoz 123 < hey
//true < false // gives error



// ternary condition operator
// condition ? true : false

let c = a >= b ? a : b

// Nil-Coalescing Operator
// ??
let d: Int? = nil
let e = d ?? 0 // if d is nil then 0 will be assign to e


// range operator
// closed range
// start...end => [start,end]

for i in 0...10 {
    print(i)
}

// half open range
// start..<end => [start, end)

for i in 0..<10 { // 10 will not included in range
    print(i)
}

// one sided range // used in array or
for i in 0... {
    
    if i > 11{
        break
    }
    print(i)
}


var range = 1...10
range = 9...9 // we can assign same type of range to variable
range.contains(10) /// check for item falls in range or not


// logical operator
// && => and , || => or , ! => not
let f1 = true
let f2 = false
if f1 && f2 { // both must be true for if part to be executed
    print(" Both are true ")
}

if f1 || f2 {
    print("Either of f1 or f2 or both are true ")
}


if !f2 {
    print("f1 is true")
}
