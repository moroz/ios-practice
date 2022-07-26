import Foundation

let arr: [Any] = [Date(), "Why was six afraid of seven?", "Because...", 789]

for element: Any in arr {
    switch element {
        case let stringValue as String: print("received a string: \(stringValue)")
        case let intValue as Int: print("received an Int: \(intValue)")
        case let dateValue as Date: print("received a date: \(dateValue)")
        default: print("I am not interested in this value")
    }
}
