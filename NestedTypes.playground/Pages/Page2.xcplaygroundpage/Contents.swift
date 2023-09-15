//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


// Nested enum in Struct

struct Car {
    enum FuelType {
        case petrol
        case diesel
        case gas
    }
    let brand: String
    let fuel: FuelType
}
let maruthi = Car(brand: "Indian Oil", fuel: .petrol)
let benz = Car(brand: "Bharat Petroleum", fuel: .diesel)
let tata = Car(brand: "Bharat Petroleum", fuel: .gas)
print("Cars: \(maruthi), \(benz), \(tata) ")

// Nested struct in class
class Company {
    struct Officer {
        var name: String
        var age: Int
    }
    var officers: [Officer] = []
    func appointOfficer(officer: Officer) {
        officers.append(officer)
    }
}
let company = Company()
let officer1 = Company.Officer(name: "Saba", age: 33)
let officer2 = Company.Officer(name: "Kannan", age: 32)
company.appointOfficer(officer: officer1)
company.appointOfficer(officer: officer2)
// Accessing officer Information
for officer in company.officers {
    print("\(officer.name) is \(officer.age) years old")
}

// Nested Enums
enum Device {
    case mobile(Specification)
    enum Specification {
        case iPhone12
        case vivoT1
        func getDetails() -> (model: String, manufacturer: String){
            switch self {
            case .iPhone12:
                return ("iPhone13", "Apple")
            case .vivoT1:
                return ("vivoT1", "Vivo")
            }
        }
    }
    mutating func addSpecs(specification: Specification) {
        self = .mobile(specification)
    }
}

var smartphone: Device = .mobile(.iPhone12)
smartphone.addSpecs(specification: .iPhone12)

print(smartphone)
