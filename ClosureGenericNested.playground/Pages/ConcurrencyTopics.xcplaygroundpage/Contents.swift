//: [Previous](@previous)

import Foundation

/*  
 Queues and Tasks
 DispatchQueue
 DispatchWorkItem
 DispatchGroup
 WorkLoop (Optional)

 Thread Scheduling
 DispatchQoS - QualityOfService

 */

/*
 Operation - An abstract class that represents the code and data associated with a single task.

 OperationQueue - A queue that regulates the execution of operations.

 addOperation, addOperations(_:waitUntilFinished:), addOperation(_:), cancelAllOperations(), waitUntilAllOperationsAreFinished()

 qualityOfService, maxConcurrentOperationCount
 isSuspended

 schedule(after:tolerance:options:_:)
 schedule(after:interval:tolerance:options:_:)



 BlockOperation - An operation that manages the concurrent execution of one or more blocks.




 */


/*
 Swift Concurrency

 Tasks
 Task(A unit of asynchronous work) , TaskGroup, TaskPriority, DiscardingTaskGroup

 Asynchronous Sequences
 AsyncSequence, AsyncStream

 Continuations
 CheckedContinuation
 withCheckedContinuation(function:_:)
 withCheckedThrowingContinuation(function:_:)

 UnsafeContinuation
 withUnsafeContinuation(_:)

 withUnsafeThrowingContinuation(_:)


 Sendable - A type whose values can safely be passed across concurrency domains by copying.
 Actor - Common protocol to which all actors conform.

 AnyActor - Common marker protocol providing a shared “base” for both (local) Actor and (potentially remote) DistributedActor types.
 MainActor - A singleton actor whose executor is equivalent to the main dispatch queue.
 GlobalActor - A type that represents a globally-unique actor that can be used to isolate various declarations anywhere in the program.

 TaskLocal - Property wrapper that defines a task-local value key.
 Executor  -
 ExecutorJob
 SerialExecutor



 */


