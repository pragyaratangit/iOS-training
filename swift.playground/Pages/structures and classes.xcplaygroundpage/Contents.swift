//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// structure
// user defined datatype which can store values for multiple keys

struct MyStruct {
var name: String
var age: Int
    let Id: Int
}

var structVar = MyStruct(name: "Aman", age: 23, Id: 1001)
print(structVar.name)
print(structVar.age)
print(structVar.Id)


structVar.name = "Aman sharma" // can be modify after initialising
//structVar.Id = 2001 // cant modify if property is let type
//print(structVar.abc)


let constStructVar = MyStruct(name: "Aman", age: 12, Id: 10002)
// constStructVar.name = "Aman sharma"
// of variable of struct is constant then we cant modify any property



// structures are value type
// deep copy
var structVarCopy = structVar
// by changing value of property of copied variable will not effect value of original
structVarCopy.name = "Pragyaratan"

print("Name of structVar = \(structVar.name) and name of structVarCopy = \(structVarCopy.name)")


// classes

class MyClass {
    var name: String
    var age: Int
    let Id: Int
    
    init(name: String, age: Int, Id: Int) {
        // self will hold reference of current instance
        self.name = name
        self.age = age
        self.Id = Id
    }
}

var classVar1 = MyClass(name: "Aamn", age: 21, Id: 2001)
print(classVar1.name)
classVar1.name = "Not aman"
print(classVar1.name)
print(classVar1.Id)


// class are reference type
// changing one variable will change its all copies
var classVar2 = classVar1
classVar2.name = "Changed by var2"
print(classVar1.name)
var classVar3 = MyClass(name: "abc", age: 123, Id: 2001)


// identical(===) and not identical(!==)
// identical -> if two variables of class type refer to same variable

if classVar1 === classVar2 {
    print("Equal")
}

if classVar1 == classVar3 {
    print("Same")
}

// equavalence -> if all properties have same value (==)
// it is defined by programmer
// this functionality will be updated in class
extension MyClass: Equatable {
    static func == (var1: MyClass , var2: MyClass) -> Bool{
        return var1.Id == var2.Id
    }
}


if classVar1 == classVar3 {
    print("Same")
}

