//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// allSatisfy

let evenArr = [0,2,10,4,20]

print(evenArr.allSatisfy{ $0 % 2 == 0})
print(evenArr.allSatisfy{ $0 % 2 != 0})



// max and min

print(evenArr.max() ?? -1)
print(evenArr.min() ?? -1)


// contains

print(evenArr.contains(where: {$0 == 18}))
print(evenArr.contains(where: {$0 == 10}))




var stringArr = ["hello", "Aman", "its", "me"]

print(stringArr.contains(where: {$0 == "aman"}))
print(stringArr.contains(where: {$0.lowercased() == "aman"}))



// reduce


var myArr = [10, 20, 30, 40]

var result = myArr.reduce(1000, {(initialVal, val) in
    return initialVal + val
})

print(result)



// map
var doubleArr = evenArr.map{
    $0 * 2
}
print(doubleArr)
var quadrapleArr = doubleArr.map{
    $0 * 2
}
print(quadrapleArr)


// conpactMap


var mixArr = ["0", "10", "hey" ,"1000", "nil"]
print(mixArr.map{ Int($0)}) // return optional value and nil if can perform operation
print(mixArr.compactMap{ Int($0)}) // return non-optional value
print(mixArr.map{$0.uppercased()}) // no nil and no optional


// flatMap
var arrayOfarray = [["hey", "cant"], ["how"], ["you"]] // make it array of string
print(arrayOfarray.flatMap{$0})



// filter
var normalArr = [1,2,3,4,4,5,3,43,24,24,3,3,4,4,322,3,432,3,2]
print(normalArr.filter{$0 % 3 == 1 || $0 % 3 == 2})


var reducedArr = normalArr.reduce("0") { partialResult, ele in
    return String(ele) + "a"
}
print(reducedArr)

