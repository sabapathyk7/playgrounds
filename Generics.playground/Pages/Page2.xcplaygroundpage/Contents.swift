//: [Previous](@previous)

import Foundation
import UIKit
// Adding constraints to the associatedtype with Equatable protocol
func isEqual<T>(_ a: T, _ b: T) -> Bool where T: Equatable {
    return a == b
}
let result1 = isEqual(5,5)
let result2 = isEqual("Hello", "Saba")

struct Container<T> where T: Equatable {
    var items: [T] = []

    mutating func addItem(_ item: T) {
        if !items.contains(item) {
            items.append(item)
        }
    }
}
var container = Container<Int>()
container.addItem(1)
container.addItem(2)
container.addItem(1)

//Multiple Associated type Constraints

protocol Drawable {
    associatedtype DrawingType
    func draw() -> DrawingType
}
struct Circle: Drawable {
    func draw() -> String {
        return "Circle"
    }
    typealias DrawingType = String
}
struct Square: Drawable {
    typealias DrawingType = UIColor
    func draw() -> UIColor {
        return UIColor.red
    }
}

let circle = Circle()
let square = Square()

let circleDrawing: String = circle.draw()
let squareDrawing: UIColor = square.draw()
