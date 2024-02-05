//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//   Closure functions can have one of these forms

//1. Global functions are closures that have a name and don’t capture any values.

//2. Nested functions are closures that have a name and can capture values from their      enclosing function.

//3. Closure expressions are unnamed closures written in a lightweight syntax that can   capture values from their surrounding context.


// normal way of sorting in decreasing order (greater appear before smaller)

func compare(arg1:String, arg2:String) -> Bool {
    return arg1 > arg2
}

// sorted function does not change original array instead it returns the sorted array but sort function modifies the array
var arrString = ["hey", "hello", "aman", "ughi", "skh", "ug"]
var sortedArr:[String] = []
//sortedArr = arrString.sorted(by: compare)
for s in sortedArr {
    print(s)
}


// sorting using closure expressions
// syntax of clouser
//{ (<#parameters#>) -> <#return type#> in
//   <#statements#>
//}


sortedArr = arrString.sorted(by: {(arg1:String, arg2:String) -> Bool  in
    return arg1 > arg2
})

// we can make function in single line
sortedArr = arrString.sorted(by: {(arg1:String, arg2:String) -> Bool  in return arg1 > arg2})

// the types of arguments will be same as type of array and return type of function will always be Bool , so ommiting type names

sortedArr = arrString.sorted(by: {arg1, arg2 in return arg1 > arg2})

// if function is single line then we can ommit return keyword due to implicit return property of function
sortedArr = arrString.sorted(by: {arg1, arg2 in arg1 > arg2})


// closure can treat arguments as $0, $1, $2 etc..
// $0 is first argument and $2 is second and both arguements will be of type string

sortedArr = arrString.sorted(by: {$0 > $1})

// we can also make it shoter by using Operator Methods
sortedArr = arrString.sorted(by: > )

for s in sortedArr {
    print(s)
}



// Trailing Closure
// closure that is pass to a function


// function that accept a closure in arguments
func tempFun(closure: () -> Void ) {
    
}

//now while calling this function
// way1 // passing closure inside function calling paranthesis
tempFun(closure: {
    // closure body goes here
    var i: Int = 0
    i += 1
})

// way2
// define closure after calling paranthesis
tempFun(){
    // closure body goes here
    var i: Int = 0
    i += 1
}

// so we can write our sortedBy method as
sortedArr = arrString.sorted(){$0 > $1}

//If a closure expression is provided as the function’s or method’s only argument and you provide that expression as a trailing closure, you don’t need to write a pair of parentheses () after the function or method’s name when you call the function:

sortedArr = arrString.sorted {$0 > $1}



// array map function accepts closure (trailing)

var numberToString = [1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine", 0:"Zero"]

var numbers = [123,432,90,12]


var ansArr = numbers.map { (number) -> String in
    var num = number
    var ans = ""
    
    repeat{
        ans = numberToString[num % 10]! + ans
        num /= 10
        
    }
    while num > 0
            
    return ans
}

for ans in ansArr {
    print(ans)
}


// another example of trailing closure
func fetch(_ url : String) -> String? {
    return "Done"
}
func exampleFun(url: String , complete: (String) -> Void, error: () -> Void ) {
    if let ans = fetch(url) {
            complete(ans)
        }
        else{
            error()
        }
}


exampleFun(url: "image.jpeg"){ (ans) in
    print("complete \(ans)")
} error: {
    print("Error")
}


// capturing value
// closure capture reference of variable from outside scope

func outerScope(incBy: Int) -> () -> Int {
    var counter = 0
    
    func innerScope() -> Int {
        counter += incBy
        return counter
    }
    
    return innerScope
}


var closureFun = outerScope(incBy: 10)


var num = closureFun()
print(num)
num = closureFun()
print(num)
num = closureFun()
print(num)
num = closureFun()
print(num)
num = closureFun()
print(num)


// closure are reference type
// if we store closure in another variable then value will be change due to this closure
var closureFunRef = closureFun
num = closureFunRef()
print(num)
num = closureFunRef()
print(num)



// escaping closure
//  A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
// escaping closure ko ham kisi variable m store krr lete hai jo function k bahar ho or fir jrurt pdne prr use call krr lete hai


var completionHandlers: [() -> Void] = []
var escapingClosure: (() -> Void?)? = nil
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
    escapingClosure = completionHandler
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100
            print("closure is called")
        }
        someFunctionWithNonescapingClosure { x = 200
            print("closure 2 is called")
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)  // Prints "200"
escapingClosure?()
//completionHandlers.first?()
print(instance.x)  // Prints "100"

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"


let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"


print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)


