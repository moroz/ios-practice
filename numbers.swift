import Foundation

let text = "21.37"

if let asDouble = NumberFormatter.init().number(from: text) {
    print(asDouble)
}

if let asNumber = Double(text) {
    print(asNumber)
}

let a : Float = 0.1
let b : Float = 0.2

let sum : Float = a + b

print(sum)
