
//: [Previous](@previous)

import Foundation

//: [Next](@next)

// Higher Order Functions

/*

 Adopts Functional Programming

 Code empowers to handle functions as essential building blocks.
 Manipulate functions and extract useful outcomes from them.

 map
 filter
 reduce
 compactMap
 FlatMap
 sorted
 ForEach

 */

// MARK: - Map
// Transforming an array
// Map - Returns an array containing the results of mapping the given closure over the sequence’s elements.
//func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]

// What is transform - Mapping closure. transform accepts and returns a transformed value of same or different type

let firstArr = ["Jones", "Theodore", "Saba", "Pathy"]
let mapArr = firstArr.map { element in
    element.lowercased()
}
print(mapArr)
// Short-hand Closure
let shortMapArr = firstArr.map { $0.lowercased() }
print(shortMapArr)

struct Employee {
    let name: String
    let age: Int
}
let empArr = [
    Employee(name: "Saba", age: 30),
    Employee(name: "Pathy", age: 30)
]
let employees = empArr.map { $0.name }
print(employees)

/*

 flatMap -
 Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.

 Use to receive single collection or sequence
 Flattened Array
 Complexity - O(m+n)
 n - sequence length
 m - result length

 */

// MARK: - flatMap - (please test it in playground app)

/*
let someArr: [Int] = [[1], [2,3], [4,5,6]]
someArr.flatMap { $0 }

let exampleArr: [[Int]] = [[1], [2,3], [4,5,6]]
let flatExampleArr = exampleArr.flatMap { $0 }
print(flatExampleArr)

let optionalNum: [Int]? = [1,2,3,4,5]
let flatOptionalNum =  optionalNum.flatMap { $0 }
print(flatOptionalNum)
*/

/*
 Compact Map - compactMap
 Returning an array of non-nil elements of transform with each element of Sequence.
 Resulting non-optional elements

 Complexity: O(n)
 Useful working with Optionals
 */

// MARK: - compactMap

let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
print(mapped)
// [Optional(1), Optional(2), nil, nil, Optional(5)]
let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
print(compactMapped)
// [1, 2, 5]

let optionalValues = ["1", "2", nil , nil, "5"]
let compactValues = optionalValues.compactMap { $0 }
print(compactValues)

/*
 Reduce - Returns result of combining the elements of the sequence using the given closure

 func reduce<Result>(
     _ initialResult: Result,
     _ nextPartialResult: (Result, Self.Element) throws -> Result
 ) rethrows -> Result

 initialResult
 nextPartialResult

 */
// MARK: - Reduce

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0, { x, y in
    x + y
})
print(numberSum)


/*
    Filter
    Filtering the array of elements by satisfying the requirements
    Parameter - isIncluded

 */

// MARK: - filter

let names = ["Jones", "saba", "Kanagasabapathy", "Rajkumar"]
let filterNames = names.filter { $0.hasPrefix("s") }
print(filterNames)

let optionalNums = [1,2,nil,3,4,5,nil, nil]
let filterNums = optionalNums.compactMap { $0 }.filter { $0 > 4}
print(filterNums)

// MARK: - sorted

let a = [1,2,3,21,23,20,100,50]
print(a.sorted())
let b = ["Adam", "John", "Saba", "Alan", "Rowe"]
print(b.sorted())

let lastArr = ["Kofi", "Anna", "Peter", "Charlie", "Chaplin"]
print(lastArr.sorted(by: <))
//["Anna", "Chaplin", "Charlie", "Kofi", "Peter"]
print(lastArr.sorted(by: >))
//["Peter", "Kofi", "Charlie", "Chaplin", "Anna"]


// MARK: - forEach

lastArr.forEach { name in
    print(name)
}


// MARK: - complexExamples

let json = """
    {
      "testArr": [
        {
          "listDate": "2021-08-23",
          "subTitle": "dmuAndSyncBuffer Workfow",
          "mainTitle": "Kanagasabapathy",
          "iconUrl": "defaultInstanceListIcon",
          "priority": [
            {
              "listDate": "2021-08-23",
              "subTitle": "dmuAndSyncBuffer Workfow",
              "mainTitle": "Kanagasabapathy",
              "iconUrl": "defaultInstanceListIcon",
              "priority": 0
            }
          ]
        },
        {
          "listDate": "2021-08-25",
          "subTitle": "dmuAndSyncBuffer Workfow",
          "mainTitle": "Pathy",
          "iconUrl": "defaultInstanceListIcon",
          "priority": [
            {
              "listDate": "2021-08-23",
              "subTitle": "dmuAndSyncBuffer Workfow",
              "mainTitle": "Kanagasabapathy",
              "iconUrl": "defaultInstanceListIcon",
              "priority": 0
            }
          ]
        }
      ]
    }
"""
print(json.data(using: .utf8))


// MARK: - TestData
struct TestData: Codable {
    var testArr: [TestArr]
}

// MARK: - TestArr
struct TestArr: Codable {
    var listDate, subTitle, mainTitle, iconURL: String
    let priority: [Priority]

    enum CodingKeys: String, CodingKey {
        case listDate, subTitle, mainTitle
        case iconURL = "iconUrl"
        case priority
    }
}

// MARK: - Priority
struct Priority: Codable {
    var listDate, subTitle, mainTitle, iconURL: String
    let priority: Int

    enum CodingKeys: String, CodingKey {
        case listDate, subTitle, mainTitle
        case iconURL = "iconUrl"
        case priority
    }
}

let data =  json.data(using: .utf8)
do {
    let decoder = JSONDecoder()
    let jsonData = try decoder.decode(TestData.self, from: data!)
    print(jsonData.testArr)
    let newData = jsonData.testArr.map { arr in
        var newArr = arr
        if arr.mainTitle == "Kanagasabapathy" {
            newArr.mainTitle = "SABA"
        }
        return newArr
    }
    print("\n Updated Data \(newData)")
} catch {
    fatalError("Error \(error)")
}



