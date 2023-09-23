//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 Nested Functions - a function can exist inside the body of another function.


 */

func someFunction() {
    print("A")
    func innerFunction() {
        print("B")
    }
    innerFunction()
}
someFunction()

func add() {
    print("A")
    func twoNumbers(num1: Int, num2: Int) {
        print(num1 + num2)
    }
    twoNumbers(num1: 5, num2: 8)
}
add()
