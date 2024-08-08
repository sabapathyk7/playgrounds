//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 Dispatch - Grand Centract Dispatch - support for concurrent code execution on multicore hardware
 DispatchQueue - Object manages execution of tasks serially/concurrently - app's main thread or background thread
 Attempting to synchronously execute a work item on the main queue results in deadlock
 Avoiding Excessive Thread Creation

 */

//
//DispatchQueue.main  - Serial
// userInteractive - Practically as fast as the main queue- dragging/pinching or animations
//userInitiated - User has initiated like tapping a button. done immediately.
// Utility - Computation, IO, Networking, continuous data feeds - balances responsiveness and performance
// Background - user not directly aware - network activity, prefetching data
// default - tasks or queues that your app initiates or uses to perform active work on the user's behalf

// Priority Inversion - if add a task from main to utility queuue - qos will become userinitiated
// Mutual exclusion - serial queue separately
//


/*

 DispatchWorkItem

 */




