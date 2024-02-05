//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

enum ExampleEnum {
    case case1
    case case2
    case case3
    case case4
}


var enumVar = ExampleEnum.case1
print(enumVar)


enum AnotherEnum{
    case case1, case2, case3, case4 , case5
}


var enumVar2 = AnotherEnum.case3
print(enumVar2)
enumVar2 = .case1


switch enumVar {
case .case1:
    print("Case 1")
case .case2:
    print("Case 2")
case .case3:
    print("Case 3")
case .case4:
    print("Case 4")
}


// iterating over enum

enum makeIterableEnum: CaseIterable {
    case case1, case2, case3, case4 , case5
}


let countCases = makeIterableEnum.allCases.count
let allCaseArray = makeIterableEnum.allCases

for cases in allCaseArray {
    print(cases)
}


// associated value
// by using associated value we can attact additional data to any case of enum of any type and each case can have different data
enum associatedEnum {
    case case1(Int, String, Int)
    case case2(Int)
    case case3(enumVar: AnotherEnum)
}


var associatedEnumVar = associatedEnum.case1(1,"One", 2)
print(associatedEnumVar)
associatedEnumVar = .case3(enumVar: enumVar2)


enum Animal {
    case Dog(name: String)
    case Cat(name: String)
    case Bunny(name: String)
}

enum petOwner{
    case Person(name: String, pet: Animal)
}


let personWithDog = petOwner.Person(name: "Aman", pet: Animal.Dog(name: "jack"))

let personWithCat = petOwner.Person(name: "Singh", pet: Animal.Cat(name: "Jullie"))


switch personWithCat {
case   .Person(let name ,.Dog(let dogName)):
    print("\(name) owns a dog of name \(dogName)")
case   .Person(let name ,.Cat(let catName)):
    print("\(name) owns a cat of name \(catName)")
    
default :
    print("Default case")
}



// Raw value
// each case is provided with a default pre-defined value of any type

enum RawValueEnum:Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
}

var rawValueVar = RawValueEnum.three
var exampleVar = RawValueEnum(rawValue: 4) // it return a optional variable
if let value = exampleVar {
    print(value)
}
print(rawValueVar)


enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
var variable = ASCIIControlCharacter(rawValue: "\r")
print(variable!)


// rawvalue can be assign implicitly

enum startFromTen:Int {
    case Ten = 10
    case Eleven, Twelve, Thirteen , Fourteen
}

var variableCase = startFromTen.Thirteen

print(variableCase.rawValue)


// Recursive Enumeration
// recursive enum is when a case of enum will hold associated value of same enum type
enum BasicMath {
    case number(Int)
    indirect case add(BasicMath, BasicMath)
    indirect case multiply(BasicMath, BasicMath)
}

let eleven = BasicMath.number(11)
let twenty = BasicMath.number(20)

let sum = BasicMath.add(eleven, twenty)

let product = BasicMath.multiply(sum , eleven)


func calculate(_ expression: BasicMath) -> Int{
    switch expression {
    case .number(let num):
        return num
    case .add(let exp1, let exp2):
        return calculate(exp1) + calculate(exp2)
    case .multiply(let exp1, let exp2):
        return calculate(exp1) * calculate(exp2)
    }
//    return 0
}

print(calculate(product))
