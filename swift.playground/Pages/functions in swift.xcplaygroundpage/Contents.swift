//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// syntax of defining

func checkForNum(arg1: Int, arg2: String) -> Bool {
    return arg1 == Int(arg2)
}

// calling syntax

print(checkForNum(arg1: 10, arg2: "100"))


// function returning multiple values

func findRange(arr: [Int]) -> (min: Int, max:Int) {
    var min = arr[0], max = arr[0]
    for item in arr {
        if min > item {
            min = item
        }
        if max < item {
            max = item
        }
    }
    
    return (min, max)
}

var min = findRange(arr: [4,2,34,5,1,43,54,1,1,13])
print(min.0, min.max)


// functions can return an optional variable

func returnOptional(flag: Bool) -> String? {
    if flag {
        return "Hey aman"
    }
    return nil
}

var message = returnOptional(flag: true)
print(message)

// if function has only one line then we can ommit return keyword

func helloMessage(name: String) -> String {
    "Hello " + name + "!"
}
print(helloMessage(name: "Pragyaratan"))


// parameterLabel => of , in , to , from , with , where
func myFunction(parameterLabel name: String){
    print(name)
}
myFunction(parameterLabel: "aman")


//variadic parameters
// it accepts 0 or any number of parameters of same type
// convert all params into array
func variadicParam(numbers: Int...){
    print(numbers.count)
    for number in numbers {
        print( number)
    }
}
variadicParam(numbers: 1,2,2,3,3,4,4,4)



// in-out parameters
// parameters which can be changed within function
// by default all params are immutable
// mutable means we modify a variable that is not recieved as parameter
func inOutExample(arg1: inout Int, arg2:inout String ){
    arg1 += 10
    arg2 = "Hello"
}

var arg1 = 1,  arg2 = "hey"

inOutExample(arg1: &arg1, arg2: &arg2)

print(arg1, arg2)

// we cant assign a default value to inout parameter
// variadic parameters can not be marked as inout


//function type  => signature of function -> (arg1Type, arg2Type) -> returnValueType

func addition(a1: Int, a2: Int) -> Int {
    return a1 + a2
}

var fun: (Int, Int) -> Int = addition
print(fun(2,3))

//function type as parameter

func functionTypeAsParam(function: (Int, Int) -> Int , a: Int, b: Int){
    print("function(a,b) => \(function(a, b))")
}

functionTypeAsParam(function: addition, a: 10, b: 20)



// function type as return type
// example of nested function
func functionTypeAsReturn(a: Int ) -> (Int) -> Int {
    func returnFunc(c: Int) -> Int {
        return c * a
    }
    return returnFunc
}


var mutiplyByNum = functionTypeAsReturn(a: 60)

print(mutiplyByNum(2))
