//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// optional chaining is accessing value of property of an optional instance

class A{
    var objB: B?
}

class B{
    var cnt: Int
    
    func fun(){
        print("do something")
    }
    
    func fun2() -> Int {
        return 6
    }
    init(cnt: Int) {
        self.cnt = cnt
    }
    
    
    subscript (index: Int) -> Int {
        return cnt * index
    }
}

var objA = A()

// this will throw error as objB is not initialise and have a value nil
//print(objA.objB!.cnt)


// in the above case we should use '?' to unwrapp the objB

print(objA.objB?.cnt)


var objB = B(cnt: 10)

objA.objB = objB

if let val = objA.objB?.cnt {
    print(val)
}

// calling methods through optional chaining
// if no value is returned by function then simple call in this way
objA.objB?.fun()

var ans = objA.objB?.fun2() // this will return an optional value as objA holds a reference of optional variable

if let ans = ans {
    print(ans)
}


// similarly we can access subscripts

class C{
    var objA: A?
    var idx: Int
    subscript (index: Int) -> Int {
        return idx * index
    }
    init(idx: Int){
        self.idx = idx
    }
}


var objC = C(idx: 10)

if let subs = objC.objA?.objB?.cnt {
    print(subs)
}


objC.objA = objA

if let subs = objC.objA?.objB?.cnt {
    print("subs " ,subs)
}

if let ans = objC.objA?.objB?[10]{
    print(ans)
}

