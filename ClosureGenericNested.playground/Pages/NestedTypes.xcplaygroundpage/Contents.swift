//: [Previous](@previous)

import Foundation
/*
 Nested Types - Nest supporting enums, classes and structures
 Types used to nest other types in type definitions
 We can define a nested class by defining one class and then declaring another class inside it. Similarly we can do for structures and enums


 */
struct BlackJackCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
}

let theAceOfSpades = BlackJackCard.Suit.spades.rawValue
print(theAceOfSpades)  // Referring to the nested types

// Nested Class

class Employer {
    var emp = Employee()
    class Employee {
        var empName = "Saba"
        var empID = 7
        var empOcc = "Dev"

        func fetchDetails() -> String {
            return "EmpID:\(self.empID), Name:\(self.empName), Occ:\(self.empOcc) "
        }
    }
}

var employer = Employer()
print(employer.emp.fetchDetails())

// Nested enum in Class

class Employee {
    enum Rating {
        case Xcellent
        case Consistency
        case Laggin
    }
    func appraisalRating() -> Rating {
        return .Consistency
    }
}
class Manager {
    let emp = Employee()
    var appraisalRating: Employee.Rating
    init() {
        self.appraisalRating = self.emp.appraisalRating()
    }
}

var result1 = Employee.Rating.Consistency
var result2 = Employee.Rating.Xcellent
var defaultRating = Manager().appraisalRating
print(result1)
print(result2)
print(defaultRating)

