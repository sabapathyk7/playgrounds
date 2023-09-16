//: [Previous](@previous)

import Foundation
/*
 Nested Functions - convenient method of naming and defining self-contained blocks of code as part of a larger function

 Closure expressions - way to write inline closures
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

