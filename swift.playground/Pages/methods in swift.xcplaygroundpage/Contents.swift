//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// Instance method
// functions which are related to each instance
// functions define inside class

struct InstaceMethodClass {
     var name: String = "Something"
     var age: Int = 21
    
    // this is isntance method
  mutating  func updateDetails(_ name: String,_ age: Int){
//        self.name = name
//        self.age = age
        
      self = InstaceMethodClass(name: name, age: age)

    }
    
    func printDetails() {
        print("Person named \(name) is \(age) years old")
    }
}


var obj = InstaceMethodClass()
obj.updateDetails("Aman", 22)
obj.printDetails()


// self property
// holds refernce to current instance
// helps in making difference between method's argument and class property
// we can assign a different self in any mutating method


// type methods
// ese methods jo class k hote hai naaki ksii instance k


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1


    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }


    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var name: String
    var levelTracker = LevelTracker()
    
    init(name: String) {
        self.name = name
    }
    
    func complete(_ level: Int){
        LevelTracker.unlock(level+1)
    }
}



var pragya: Player = Player(name: "Paragyaratan")
pragya.complete(1)
pragya.complete(2)
pragya.complete(3)
pragya.complete(4)

print("Highest completed level \(LevelTracker.highestUnlockedLevel)")
var ratan = Player(name: "Ratan")

// as ratan is playing on same device so then game level for him will also be the level for pragya becoz level is a static member and will be same for all instance
print(ratan.levelTracker.advance(to: 4))


