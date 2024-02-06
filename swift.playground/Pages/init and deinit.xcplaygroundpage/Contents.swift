//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// initialization is used to initialise all properties of class/struct


class TempClass {
    var p1: Int
    var p2: String
    
    // parameterize initialization
    init(p1: Int, p2: String) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // custome init
    // available by default if no init is defined
    init(){
        // assign the default value
        self.p1 = 0
        self.p2 = "default"
        print(" this init has been called")
    }
    
    // can initialise some value and must calls the designated init with default value for other properties
    convenience init(p1: Int){
        
        self.init(p1:p1, p2:"No value")
    }
    
    deinit {
        print("Deinitializer is called")
    }
    
}




// for struct we dont need to create mutiple initializer instead struct provide us named initialization





// deinitization -> process of deallocation of all the resources
// called for each object immediately before a class instance is deallocated.
// no need to define or call but when used some resources that swift can deallocate then we should impliment this also


// in case of inheritance super.init should call after initialising all the properties of subclass 

var obj: TempClass? = TempClass()
print("obj is used ")
obj = nil
