//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// collection -> storage for values
// Arrays


var arr: [Int] = [] // syntax for declaring an empty array

print("type of arr is \(type(of:arr)) and elements in arr is \(arr.count)")


// direct initialisation
var arr2 = [1,2,3,3,4] // can contain same item multiple times

// initiaser
var tripleArray = Array(repeating:1, count: 5)
print(tripleArray)

var combinedArr = tripleArray + arr2
print(combinedArr)

combinedArr.append(7) // append 7 at the last of array


combinedArr += [1,2,3] // adds 1,2,3 at last of array
print(combinedArr)

var firstItem = combinedArr[0] // indexing start from 0 and end at count-1

// replacing elements in subscript syntax
combinedArr[7...9] = [9,0,90]


combinedArr[0..<combinedArr.count] = [0]
var newArr = combinedArr
print(type(of: newArr) , type(of: combinedArr))

combinedArr.insert(2,at: 0)
combinedArr.remove(at: 1)


combinedArr = [1, 1, 1, 1, 1, 1, 2, 3, 3, 4, 7, 1, 2, 3]
// removing using condition
combinedArr.removeAll {$0 >= 3}
print(combinedArr)


// for in loops

for item in combinedArr {
    print(item)
}

// with index
for (index, item) in combinedArr.enumerated() {
    print(index, item)
}



// sets
// store only unique items

// declaring set
var mySet = Set<String>()

// inserting new elements
mySet.insert("hello")
mySet.insert("hey")
mySet.insert("wow")
mySet.insert("cool")
mySet.insert("good")
mySet.insert("hello")
mySet.insert("wow")

print("Type of set \(type(of:mySet)) and count = \(mySet.count)")

print(mySet)
 
var newSet: Set<String> = ["a", "e", "c", "d", "a"]
print(newSet.count)


print(newSet.isEmpty) // its a property which tells wheather set is empty or not

if newSet.contains("d") {
    print(#"newSet contains "d" "#)
}

// returns the removed item's optional
print(mySet.remove("wow") ?? "hey")

// loops
for i1 in newSet.sorted()  {
    print(i1)
}


// set operations

var set1: Set<Int> = [1,2,3,4,5,6,7,8,9]
var set2: Set<Int> = [2,4,6,8,0]

// union
// set1 + set2 // all unique items of both sets
var unionSet = set1.union(set2)

// intersection
// only common items of both sets
var intersectionSet = set1.intersection(set2)

// subtraction
var subtractedSet1 = set1.subtracting(set2) // elements of set1 only (not commons)
print(subtractedSet1)

var subtractedSet2 = set2.subtracting(set1) // elements of set1 only (not commons)
print(subtractedSet2)


// symmetric difference
// removes only common elements and print union
// set1 + set2 - intersection(set1,set2)
var symmetricDif1 = set1.symmetricDifference(set2)
print(symmetricDif1)
var symmetricDif2 = set2.symmetricDifference(set1)
print(symmetricDif2)



// membership and equality
// equals => checkes if all elements are same or not
print(symmetricDif1 == symmetricDif2)


// disjoint
// checks if no common element is present
print(subtractedSet1.isDisjoint(with: subtractedSet2))

// superset
// if set1 contains all elements of set2 then set1 is called super set of set2
print(unionSet.isSuperset(of: intersectionSet))

// subset
// is all elements of set2 are in set1 then set2 is called subset of set1
print(set2.isSubset(of: unionSet))


//strict superset and subset bound the set to be not equal
// it means if two sets are equal then one is not strictly subset of second
// [1,2,3] is subset of [1,2,3,4]
set1 = [1,2,3,4,5]
set2 = [1,2,3,4,5]
print(set1.isStrictSubset(of: set2))




// dictionary
// stores key-value pair unorderly

var myDict: [Int: String] = [:] // it creats an empty dictionary

myDict[10] = "Ten"
myDict[15] = "Fifteen"

print(myDict.count)
print(myDict)

// initialising dictionary
var newDict = ["1":"one", "2": "Two"]
print(newDict["1"])
newDict["1"] = "ONE"
print(newDict["1"])
print(newDict["5"] ?? "no value present")


// removing value
let removedVal = newDict.removeValue(forKey: "2")!
print(removedVal)


// loops

for (key, value) in myDict {
    print("value of key => \(key) is \(value)")
}

// keys
for key in myDict.keys {
    print(key)
}
for value in myDict.values {
    print(value)
}

// array of all keys and value
var keysArray = [Int](myDict.keys)
var valuesArray = [String](myDict.values)
