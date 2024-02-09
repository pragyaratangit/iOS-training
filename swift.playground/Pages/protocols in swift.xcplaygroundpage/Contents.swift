//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Blue print of class / structure / enum
// Define requirements that conforming types must implement.
// syntax

protocol MyProtocol {
    var property1: Int {get set}
    var property2: Int {get}
    
    func method(arg1: Int) -> Int
    
    init()
}


class MyClass: MyProtocol {
    var property1: Int {
        get {
            return self.property2 * 10
        }
        set {
            self.property1  = newValue / 2
        }
    }
    
    var property2: Int {
        return 10
    }
    
    func method(arg1: Int) -> Int {
        return arg1 * 2
    }
    
    // required keyword is required when a class is conforming to a protocol
    required init() {
        print("Class initializer called")
    }
}


var myObj = MyClass()

myObj.property1
myObj.property2
myObj.method(arg1: 10)


// extention and protocols

//Existing instances of a type automatically adopt and conform to a protocol when that conformance is added to the instance’s type in an extension.


protocol A{
    var description: String {get}
}


extension Int: A {
    var description : String {
        if self == 0 {
            return "zero"
        }
        if self < 0 {
            return "negative"
        }
        return "positive"
    }
}


print("\((-10).description)")



// conditional conforming
// using where condition -> when we put some checks on protocol confirmation


extension Array: A where Element: A {
    var description : String {
        let itemsAsText = self.map { $0.description }
        print(itemsAsText)
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let arr = [1,2,-1,-1,0,12,-1]

print( arr.description)


// we can create collection of any protocol


//Protocol Inheritance
//protocol can be inherited from one or multiple other protocol

/*
protocol p1: p2, p3 {
    
}
*/

// Class only protocol
protocol ClassOnly: AnyObject {
    // only class can inherit this protocol
}

// will show a compile time error
//struct SomeStruct: ClassOnly  {
//    var name: String
//}



// Protocol Composition
// if some class inherit from more than 1 protocol or super class then we can pass its object as protocol1 & className type

class NewClass: ClassOnly , A {
    var description: String = "Hello"
}

func tempFun(arg1 : ClassOnly & A){
    print(#"Object conforms to "ClassOnly" and "A" protocol"#)
    
}

var obj = NewClass()
tempFun(arg1: obj)


// typecheck -> wheather current object conforms to some protocol or not -> is
// downcast -> if object confirms some protocol
// as? return optional while as! forced unwrapp the optional


// Protocol Delegate
// when optinal ref of an object of some class is used by anither class to do some work

class DelegateClass{
    var prp1: Int = 100
    func doSomeWork() {
        print("work done")
        
    }
  
}

class AnotherClass {
    var delegate: DelegateClass? = nil
    
    func work() {
        delegate?.doSomeWork()
    }
}

var realObj = AnotherClass()

realObj.work()

realObj.delegate = DelegateClass()

realObj.work()
