import Foundation

let aDictionary = [
    1: "a",
    2: "b"
]

print(aDictionary)

let doubleKeys = [
    21.37: "Pope John Paul II",
    420: "Blaze it"
]

print(doubleKeys)

let stringKeys = [
    "a": 1,
    "b": 2
]

print(stringKeys)

let someKey = "I am a string"
let otherKey = "I am another string"

let exprKeys = [
    someKey: 123,
    otherKey: 456
]

print(exprKeys)

let mixedKeys: [AnyHashable: Any] = [
    "a": 1,
    2: "b"
]

print(mixedKeys)

let encoder = JSONEncoder()
let jsonData = try encoder.encode(aDictionary)
if let json = String(data: jsonData, encoding: .utf8) {
    print(json)
}
