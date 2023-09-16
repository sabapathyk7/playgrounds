//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

struct Employee {
    let name: String
}
var employees = [
    Employee(name: "Kanagasabapathy"),
    Employee(name: "sabapathy"),
    Employee(name: "Saba Raj"),
    Employee(name: "Saba"),
    Employee(name: "Kannan")
]
extension Collection where Element == String {
    func sortedByLength() -> [Element] {
        sorted(by: { $0.count > $1.count })
    }
}

var employeeSortedByNameLength: [Employee] {
    employees.sorted(by: { $0.name.count > $1.name.count })
}
func longestName() -> String {
    guard let longestName = employeeSortedByNameLength
        .first?.name else {
        return "No Longest Name"
    }
    return longestName
}
func shortestName() -> String {
    guard let shortestName = employeeSortedByNameLength
        .last?.name else {
        return "No Longest Name"
    }
    return shortestName
}

shortestName()
longestName()

// Generic Class
class Info<T> {
    var data: T
    init(data: T){
        self.data = data
    }
    func getData() -> T {
        return self.data
    }
}

let ageInfo = Info(data: 7)
print(ageInfo.getData())
let nameInfo = Info(data: "Sabapathy")
print(nameInfo.getData())


func additionOfTwoNums<T: Numeric>(num1: T, num2: T) -> T{
    print(num1 + num2)
    return (num1 + num2)
}
additionOfTwoNums(num1: 7, num2: 9)
