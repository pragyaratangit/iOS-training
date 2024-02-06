//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// inheritance
// when one class(child) inherit properties and methods of another class(parent)

// employee <- developer <- intern

class Employee{
    var name: String
    var hours: Int
    
    init(name: String, hours: Int) {
        self.name = name
        self.hours = hours
    }
}

class Developer: Employee {
    // final will make this property unable to override by its subclass
    final var eID: Int
    
    init(_ name: String, _ hours: Int , _ id:Int){
        eID = id
        super.init(name: name, hours: hours )
        
        
    }
    func details(){
        print("Hey I am \(name) and i work for \(hours) hours a day")
    }
    
    
}


class Manager: Employee {
    var mID: Int
    
    init(_ name: String, _ hours: Int , _ id:Int){
        mID = id
        super.init(name: name, hours: hours )
        
    }
    func details(){
        print("Hey I am \(name) and i work for \(hours) hours a day")
    }
}


var emp1 = Developer("aman", 8, 101)
var mng1 = Manager("sharma", 10 , 1001)

emp1.details()
mng1.details()



class Intern: Developer {
    
    override init(_ name: String, _ hours: Int , _ id:Int){
        
        super.init(name, hours ,id)
    }
    override func details() {
        print("I am \(name) and I only learn \(hours) hours ")
    }
}


var intern1 = Intern("Ratan", 7, 001)
intern1.details()
print(intern1.eID)




// if we want to prevent some property to be inherit then we should mark them as fileprivate and then make their subclass in different file


