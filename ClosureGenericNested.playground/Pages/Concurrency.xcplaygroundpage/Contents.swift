//: [Previous](@previous)

import Foundation


//: [Next](@next)

func oldCurrencyCode() {
    DispatchQueue.main.async {
        print("Main Thread")
    }
    OperationQueue.main.addOperation {
        print("Operation - Main Thread")
    }
    DispatchQueue.global(qos: .background).async {
        print("Background Thread")
    }
    let operationQueue = OperationQueue()
    operationQueue.qualityOfService = .background
    operationQueue.addOperation {
        print("Operation - Background Thread")
    }
}
func serialQueueTesting() {
    let serialQueue = DispatchQueue(label: "SerialQueue")
    serialQueue.sync {
        print("serialQueue Task1 Started")
        print("serialQueue Task1 finished")
    }
    serialQueue.async {
        print("serialQueue Task2 Started")
        print("serialQueue Task2 finished")
    }
}

func concurrentQueueTesting() {
    let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    concurrentQueue.async {
        print("Concurrent with Async - Task2 Started")
        print("Concurrent with Async - Task2 Finishes")
    }
    concurrentQueue.sync {
        print("Concurrent with Sync - Task1 Started")
        print("Concurrent with Sync - Task1 Finishes")
    }
}

oldCurrencyCode()
serialQueueTesting()
concurrentQueueTesting()


func newConcurrencyCode() {
    Task {
        print("Task1")
        print("Task2")
    }
    Task(priority: .utility) {
        print("Utility Task1")
        print("Utility Task2")
    }
    Task { @MainActor in
        print("MainActor Task")
    }
    Task(priority: .background) {
        print("BackgroundTask1")
        print("BackgroundTask2")
    }
    Task(priority: .userInitiated) {
        print("UserInitiated Task1")
        print("UserInitiated Task2")
    }
    Task(priority: .high) {
        print("High Task1")
        print("High Task2")
    }
    Task(priority: .low) {
        print("Low Task1")
        print("Low Task2")
    }
    Task(priority: .medium) { // Default
        print("Medium/Default Task1")
        print("Medium/Default Task2")
    }
}
newConcurrencyCode()


// Async Await

struct Person {
    var id: String
    var name: String
    var age: String
    var email: String
}

/*
func makeRequest() async throws -> Person {

}

@MainActor
func createRequestAndUpdate() async {
    do {
//        let model = try await makeRequest()
//        view.updateModel(model)
    } catch {
        fatalError("Error")
    }
}
 */
@MainActor class ViewModel: ObservableObject {
    func runTest() async {
        print("1")

        await MainActor.run {
            print("2")

            Task { @MainActor in
                print("3")
            }

            print("4")
        }

        print("5")
    }
}
let viewModel = ViewModel()
await viewModel.runTest()

func couldBeAnywhere() {
    Task { @MainActor in
        print("This is on the main actor.")
    }

    // more work you want to do
}

couldBeAnywhere()

/*
    Non-async Methods
    withUnsafeContinuation(_:)
    withUnsafeThrowingContinuation(_:)
    withCheckedContinuation(_:)
    withCheckedThrowingContinuation(_:)
    withTaskCancellationHandler(operation:onCancel:)
 Unsafe Methods - bypass some of Swift's consistency rules regarding the encapsulated closures
 Checked methods
 */


// MainActor vs DispatchQueue.main.async {}


