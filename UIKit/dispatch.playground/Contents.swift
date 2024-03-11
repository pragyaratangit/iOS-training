import UIKit

var greeting = "Hello, playground"

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*
DispatchQueue.main.async {
    
    
    for i in 1...5 {
        print(i)
    }
}

for i in 6...10 {
    print(i)
}


DispatchQueue.main.async{
    for i in 11...15 {
        print(i)
    }
}
*/

// in main queue we first push the task1 which is print(1-5) then we pushed task2 which is print from 11-15

// main queue is serial queue so it comletes one task and then only start executing other task

// main queue uses mainThread while global() queue uses some system provided concurrent queue

/*

DispatchQueue.global().async {
    print(Thread.isMainThread ? "task is running on main thread" : "Task is running on some concurrent queue")
    for i in 21...25 {
        print(i)
    }
}
DispatchQueue.global().async {
    for i in 31...35 {
        print(i)
    }
}
DispatchQueue.global().async {
    for i in 41...50 {
        print(i)
    }
}

*/
// Quality of Service(QoS)
// used for specifying priority of task

/*
DispatchQueue.global(qos: .background).async {
    print("background qos task started")
    for i in 101...110 {
        print(i)
    }
    print("background qos task finished")
}
DispatchQueue.global(qos: .utility).async {
    print("utility qos task started")
    for i in 111...120 {
        print(i)
    }
    print("utility qos task finished")
}
DispatchQueue.global(qos: .userInitiated).async {
    print("userInitiated qos task started")
    for i in 121...130 {
        print(i)
    }
    print("userInitiated qos task finished")
}
DispatchQueue.global(qos: .userInteractive).async {
    print("userInteractive qos task started")
    for i in 131...140 {
        print(i)
    }
    print("userInteractive qos task finished")
}

*/

/*

// target queue
// a queue which execute task of other queue

// by default queue is a serial queue
let a = DispatchQueue(label: "A")
// we can set the target at the time of creating a queue
let b = DispatchQueue(label: "B", attributes: .concurrent, target: a)

// other way of setting target
let c = DispatchQueue(label: "C", attributes: .initiallyInactive)
// target should be sepecify before activating that queue
c.setTarget(queue: b)
c.activate()

a.async {

    for i in 1...5 {
        print(i)
    }
}

b.async {
    for i in 10...15 {
        print(i)
    }
}

b.async {
    for i in 30...35 {
        print(i)
    }
}
a.async {
    for i in 20...25 {
        print(i)
    }
}


*/




//

// if we execute a task syncronously on some queue(other than main)
// then it may happend that our main thread is idea at that time
// so for better speed the task execute on main thread
DispatchQueue.global().sync {
    print(Thread.isMainThread ? "main" : "other")
    for i in 1...10 {
        print(i)
    }
}
