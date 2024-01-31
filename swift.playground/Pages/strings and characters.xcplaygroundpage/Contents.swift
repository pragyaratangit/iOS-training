//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var str = "This is temp string"
print(str)

var singleLineString = "Should be initialize in double quotes"

// for multiline string we must start it from next line
var multipleLineString = """
This is example of "multi-line
string"
"""
print(multipleLineString)


//let softWrappedQuotation = """
//The White Rabbit put on his spectacles.  "Where shall I begin, \
//please your Majesty?" he asked.
//
//"Begin at the beginning," the King said gravely, "and go on \
//till you come to the end; then stop."
//
//"""
//print(softWrappedQuotation)


// escaping special chars
// in case of double quotes in string we must separate them from quotes of string
let myStr = " \"Hey, how are you?\" - same"
print(myStr)


// unicode
// ascii is proper subset of unicode
// anycharacter of sign can be represented by unicode
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
print(sparklingHeart)


//Extended String Delimiters
var s = #"abs\n"# // this will print \n due to #
print(s)

// characters

for chars in s{
    print(chars)
}

var arrayOfChar: [Character] = ["h", "e", "l" , "l", "o"]
for c in arrayOfChar {
    print(c)
}

var hello = String(arrayOfChar)
print(hello)


s += hello // allowd -> this will append hello at the end of s
//You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.


// String interpolation
// using some other variables in string
var a = 10
let b = 2

print("multiple \(a) and \(b) is \(a*b)")

// is using string Delimiters then value will not calculated as usual
print(#"this will print with " \#(a*b) "#)




// indexes and size
// count for size
print(hello.count )

// startIndex => first char
print(hello[hello.startIndex])

// before => before given index
print(hello[hello.index(before: hello.endIndex)])

// endIndex => last index
// character is not available at this place
//print(hello[hello.endIndex]) // gives error

// after => after given index
print(hello[hello.index(after: hello.startIndex)])

// offset => after required number
let index = hello.index(hello.endIndex, offsetBy:-2) // negative means before
print(hello[index])



// insert and remove

//insert at end => append

hello.append(" aman")
print(hello)

// insert at some index
hello.insert(contentsOf: "arya", at: hello.index(hello.startIndex,offsetBy: 3 ))


// remove single char
hello.removeFirst()
print(hello)
hello.remove(at: hello.index(before: hello.endIndex))
print(hello)

// removes a range of string
let delRange = hello.index(hello.endIndex, offsetBy:-2)..<hello.endIndex
hello.removeSubrange(delRange)



// substrings
hello = "hello aman arya"
let idx = hello.firstIndex(of: "a") ?? hello.endIndex // it return a option so we should handle it carefully
print(idx)


let mytr = hello[...idx]
print(type(of: mytr))

// hasPrefix and hasSuffix can be used to check wheather string has given prefix or suffix

if hello.hasPrefix("el") {
    print("prefix present")
}
