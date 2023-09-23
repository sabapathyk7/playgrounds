//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*

 Closures are the self-contained blocks that can be passed around and used the code.
 Capture the values and store a reference to any constants and variables
 */

/* 
 Syntax
 { (<#parameters#>) -> <#return type#> in

 }
 */

/*
 Trailing Closure - Special syntax - Rather than passing in your closure as parameter, you can pass after the function inside the braces()


 */

func closure(action: () -> Void) {
    print("1.")
    action()
    print("end of function")
}
closure {
    print("2.")
}
func closure(action: (String) -> Void) {
    print("3.")
    action("Saba")
    print("end of function")
}
closure { str in
    print(str)
}

func closure(action: (String) -> String) {
    print("4.")
    action("Saba")
    print("end of function")
}

closure { str in
    print("return \(str)")
}

// shorthand
closure {
    "Catching \($0) value"
}

// Multiple Arguments

func closure(action: (String, Int) -> String) {
    print("5.")
    action("Saba", 7)
    print("end of function")
}
closure { str, value in
    return "\(str) fav number is \(value)"
}

closure {
    "My name is  \($0) and my fav number is \($1)"
}

/*
 Closure Types
  - Global Functions
  - Nested Functions
  - Closure Expressions
 */

// Closure Expression -

let closureEx: (Int) -> String = { number in
    return "number is \(number)"
}
closureEx(7)

// Capturing Values in a Closure

func incrementer(amount: Int) -> () -> Int {
    var total = 2
    let increment: () -> Int = {
        total += amount
        return total
    }
    return increment
}
let value = incrementer(amount: 7)
print(value())

/*
 Escaping Closures
 When passing closure as argument - preserved to be executed later and function's body gets executed returns the compiler back.
 As Execution ends, the scope exist and have existence in memory, till the closure gets executed

 Ways to escaping closure
     - Storage - Preserve the closure in storage in memory, part of the calling function get executed and return the compiler back
     - Asynchronous Execution - Executing the closure async on dispatch Queue, queue will hold the closure in memory, to be used for future. - No idea of when the closure gets executed
 */

/*
 Life Cycle
  - Pass the closure as function argument
  - Do additional work in func
  - Func execute async or stored
  - Func returns compiler back
 */

let url = URL(string: "https://www.geeksforgeeks.org/")!
let data = try? Data(contentsOf: url)

// Function to call the escaping closure
func loadData(completion: @escaping (_ data: Data?) -> Void)
{
    DispatchQueue.global().async
    {
        let data = try? Data(contentsOf: url)
        DispatchQueue.main.async
        {
            completion(data)
        }
    }
}

// use data
loadData { data in
        guard data != nil else {

    // Handle error
    return
    }
}

// Print result
print("Data loaded")

/*
 Autoclosures- Automatically created to wrap a piece of code. way to delay the execution of closure until it is actually needed.
 Autoclosures - used as arguments to functions where closure is optional or where closure's execution may not be necessary

 */

func logIfTrue(_ condition: @autoclosure() -> Bool) {
    if condition() {
        print("True")
    } else {
        print("False")
    }
}

logIfTrue("Saba" > "pathy")

func delayedPrint(delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
print("Start")
delayedPrint(delay: 2) {
    print("Hello World")
}


func delayedPrint(delay: Double, closure: @escaping @autoclosure () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
print("Start 2")
delayedPrint(delay: 5, closure: print("Hellow Saba"))
