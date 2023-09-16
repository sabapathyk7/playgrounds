//: [Previous](@previous)

import Foundation
/*

 Closures are self-contained blocks of functionality that can be passed around and used in your code.

 Closures can capture and store references to any constants and variables
 Swift handles Memory Management of capturing
 Capturing Values

 Nested Functions - convenient method of naming and defining self-contained blocks of code as part of a larger function

 Closure expressions - way to write inline closures
 */


/*

 Global and nested functions, as introduced in Functions

 Global - closures have name but not capture any values
 Nested - can have name and also capture the values
 Closure Expressions - unnamed closures

 */


// Sorted Function

let names = ["Lorem", "ipsum", "dolor", "sit", "amet"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
names.sorted(by: backward)

/* Closure Expression

 { (<#parameters#>) -> <#return type#> in

 }
 */


var reversedNames = names.sorted { s1, s2 in
    return s1 > s2
}

// Implicit Return
var implicitReversedNames = names.sorted { s1, s2 in
    s1 > s2
}

// Shorthand Argument
var shorthandReversedNames = names.sorted(by: { $0 > $1 })

//Operator methods

reversedNames = names.sorted(by: >)



// Trailing Closures
// way to write cleaner and more readable code when using functions or methods that takes closures as arguments
func performAction(action: () -> Void) {

}
// Without Trailing Closure
performAction {

}
// Without Trailing Closure
performAction {

}


names.sorted { $0 > $1}


//Capturing Values

/*
 Closure can capture constants and variables from the context

 Simplest form of closure that capture values is nested function
 Nested function can capture values from outer function and inside the function

 */


func addCount(forCount amount: Int) -> () -> Int {
    var total = 0
    func counter() -> Int {
        total += amount
        return total
    }
    return counter
}

// counter doesn't have any paramter but returns Int value
// Capturing by reference
// Swift handles memory managemnet involved for capturing values

let countByTen = addCount(forCount: 10)
print(countByTen()) //prints 10

// Functions and  Closure are Reference Types

let addCountbyTen = countByTen
print(addCountbyTen()) // prints 20

print(countByTen()) // prints 30

// Escaping Closures
/*
 escape a function when closure - passed an argument to the function but it called after the function returns
 @escaping

  Being stored in a variable that defined outside the function
 asynchronous operation - closure argument as a completion handler


 */


var completionHandlers: [() -> Void] = []
func escapingClosure(completionHandler: @escaping () ->  Void) {
    completionHandlers.append(completionHandler)
}

// if we didn't mark as escaping - compile time error



// AutoClosures

// Delay the evaluation of expression until its actually needed
// It evaluates only when the function explicitly requests
// Improving performance
func printSum(_ getNumbers: @autoclosure () -> Int) {
    let result = getNumbers()
    print(result)
}
printSum(7+2)

func getName(_ names: @autoclosure () -> String) {
    print(names())
}

var names1 = ["Lorem", "ipsum", "dolor", "sit", "amet"]
getName(names1.remove(at: 0))
