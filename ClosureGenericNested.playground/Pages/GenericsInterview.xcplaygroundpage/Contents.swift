//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
    What is Generics in swift and how useful in the applications?

 - Generics in swift allows flexible and reusable code that can work in different types while maintaining type safety
  - Key Points are
     - Type Safety,
     - Reusability
     - Parameterization
     - Collections - Arrays or Dictionaries
     - Add constraints to type parameters specifying which protocols that can conform to
     - Performance will be good
     - Good Example - Swap two numbers or swap two strings / doubles in a single generic method
     - Another good example - filter an array of generic type
       using Element
     - Associated types are powerful feature of Generics helps in the reusable code

 To create a generic protocol you can use Self in it, or add associated type to it.
 Self refers to the eventual type that conforms to the protocol

 Grammar of a type alias declaration

 typealias-declaration → attributes? access-level-modifier? typealias typealias-name generic-parameter-clause? typealias-assignment

 typealias-name → identifier

 typealias-assignment → = type



 Grammar of a protocol associated type declaration

 protocol-associated-type-declaration → attributes? access-level-modifier? associatedtype typealias-name type-inheritance-clause? typealias-assignment? generic-where-clause?


 */
