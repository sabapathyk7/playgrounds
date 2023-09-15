//: [Previous](@previous)

import Foundation


//: [Next](@next)
// got this example - apt example during Covid restrictions
enum PermittedActivity {
    case sleep
    case exercise(exercise: PermittedExercise)
    case shop(destination: OpenShops)
    case coding

    enum PermittedExercise {
        case run
        case walk
        case skip
    }
    enum OpenShops {
        case superMarket
        case onlineStore
    }
}
let activity = PermittedActivity.coding
/*
 let run = PermittedExercise.run
 //Cannot find 'PermittedExercise' in scope

 */


/*
 Why should you choose a struct over an enum? Well, structs can be instantiated where as enums cannot.

 */
struct Activity {
    var permittedActivity: PermittedActivity
    enum PermittedActivity {
        case sleep
        case exercise(exercise: PermittedExercise)
        case shop(destination: OpenShops)
        case coding

        enum PermittedExercise {
            case run
            case walk
            case skip
        }
        enum OpenShops {
            case superMarket
            case onlineStore
        }
    }
}

let sleepActivity = Activity(permittedActivity: .sleep)
let exercise = Activity(permittedActivity: .exercise(exercise: .walk))
print(sleepActivity.permittedActivity)
print(exercise.permittedActivity)


