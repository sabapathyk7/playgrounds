//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func listImages() async throws -> [String] {
    print("Start")
    try await Task.sleep(until: .now + .seconds(10), clock: .continuous)
    return ["IMG1", "IMG2", "IMG100", "IMG70"]
}
let task = try await listImages()
print(task)


// Async Sequences

let handle = FileHandle.standardInput

for try await line in handle.bytes.lines {
    print(line)
}
