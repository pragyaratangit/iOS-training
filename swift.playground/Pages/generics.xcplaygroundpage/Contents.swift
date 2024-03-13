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



// Generic types

struct MyStack<Element> {
    var arr: [Element] = []
    var size = 0
    
    mutating func push(_ item: Element){
        arr.append(item)
        size+=1
    }
    
    mutating func pop() -> Element {
        var val = arr[size-1]
        arr.removeLast()
        size-=1
        return val
    }
    
    
}

var stack = MyStack<String>()

stack.push("abc")
stack.push("bcd")
stack.push("cde")
stack.push("def")
stack.push("efg")


while stack.size > 0 {
    print(stack.pop())
}


protocol GenericProtocol2{
    // contraint to associated type
    associatedtype  prp1: Equatable
}

class GenericClass2: GenericProtocol {
    typealias prp1 = String // now prp1 will be of type Int
}


// generic with where clause

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}


// a function which gets two input both of type container
func allItemsMatch<C1: Container, C2: Container>
        (_ firstContainer: C1, _ secondContainer: C2) -> Bool
        where C1.Item == C2.Item, C1.Item: Equatable {

    if firstContainer.count != secondContainer.count {
        return false
    }

    for i in 0..<firstContainer.count {
        if firstContainer[i] != secondContainer[i] {
            return false
        }
    }

    return true
}


// we can add where clouse while defining function con
// contextual where clause
extension Container {
    func average() -> Double where Item == Int {
        var sum = 0
        for i in 0..<count {
            sum += self[i]
        }
        
        return Double(sum) / Double(count)
    }
}

// where clause can be add in extention itself
// Generic where clause
extension Container where Item == Int {
    func average2() -> Double where Item == Int {
        var sum = 0
        for i in 0..<count {
            sum += self[i]
        }
        
        return Double(sum) / Double(count)
    }
}


// generic subscript
extension Container {
    // Indices is for subscript type
    // it will return array of Item
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
            where Indices.Iterator.Element == Int {
        var result: [Item] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}



// generic in return type


func genericReturn<T>(_ input: Bool) -> T {
    if input {
        return 1 as! T
    }
    return "false" as! T
}

let intValue: Int = genericReturn(true)
let stringValue: String = genericReturn(false)

print(intValue, stringValue)
