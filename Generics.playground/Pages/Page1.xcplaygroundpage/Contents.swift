//: [Previous](@previous)

import Foundation

/*
 Generics - enables to write reusable flexible functions and types of any type subject to requirements
 Avoid duplication
 most powerful feature
 Array and Dictionary types are Generic collection

 We can create dictionary to store values of any specified type
 */

// Problems can be solved by Generics
// Using third variable
/*
 inout - has a value passed in to the function, is modified by function
 passed back out of the function to replace the original value.
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var a = 1
var b = 7
swapTwoInts(&a ,&b)
print(a, b)

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}
var str1 = "Saba"
var str2 = "tr"
swapTwoStrings(&str1 ,&str2)
print(str1, str2)

// without third variable

func swapTwoInt(_ a: inout Int, _ b: inout Int) {
    (a,b) = (b,a)
}
var c = 1
var d = 7
swapTwoInt(&c ,&d)
print(c, d)

func swapTwoString(_ a: inout String, _ b: inout String) {
    (a,b) = (b,a)
}
var str3 = "Saba"
var str4 = "tr"
swapTwoString(&str3 ,&str4)
print(str3, str4)

// Using Generics - we can swap two values of any data type
func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
    (a,b) = (b,a)
}
var d1 = 2.52413132
var d2 = 7.77837812
swapTwoValue(&d1, &d2)
print(d1, d2)

/*
 Generic Types
 generic collection type called Stack
 Stack - Ordered set of values
 */

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() {
        items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
//Lorem ipsum dolor sit amet
stackOfStrings.push("Lorem")
stackOfStrings.push("ipsum")
stackOfStrings.push("dolor")
stackOfStrings.push("sit")
let fromTop: () = stackOfStrings.pop()
print(stackOfStrings)

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfStrings.topItem {
    print("Top Item is \(topItem)")
}

// Type Constraints
func findIndex(ofString valuetoFind: String, in array: [String]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valuetoFind {
            return index
        }
    }
    return nil
}
let strings = ["Lorem", "ipsum", "dolor", "sit", "amet"]
if let foundIndex = findIndex(ofString: "amet", in: strings) {
    print("Index is \(foundIndex)")
}

// Equatable will resolve the compile time errors
func findIndex<T: Equatable>(of valuetoFind: T, in array: [T]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valuetoFind {
            return index
        }
    }
    return nil
}
print(findIndex(of: "ipsum", in: ["Lorem", "ipsum", "dolor", "sit", "amet"]))
print(findIndex(of: 2, in: [1,5,2,4,7]))

// Associated Type
protocol A {
    associatedtype Element
    mutating func append(_ element: Element)
    var count: Int { get }
}

// Non Generic Int Stack
struct IntStack: A {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
    typealias Element = Int
    mutating func append(_ element: Element) {
        self.push(element)
    }
    var count: Element {
        return items.count
    }
}
var intStack = IntStack(items: [1, 2, 3, 4, 5])
print(intStack.count)
intStack.pop()
intStack.push(6)
intStack.append(7)
print(intStack)


// Generic  Stack
struct GenericStack<Element>: A {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        items.removeLast()
    }
    mutating func append(_ element: Element) {
        self.push(element)
    }
    var count: Int {
        return items.count
    }
}

var stackInt = GenericStack(items: [1, 2, 3, 4, 5])
print(stackInt.count)
stackInt.pop()
stackInt.push(6)
stackInt.append(7)
print(stackInt)

var stackStr = GenericStack(items: ["Lorem", "ipsum", "dolor", "sit", "amet"])
print(stackStr.count)
stackStr.pop()
stackStr.push("Saba")
stackStr.append("Meat")
print(stackStr)



// Adding constraints to the associatedtype with Equatable protocol

