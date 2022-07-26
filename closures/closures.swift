import Foundation

let collection = ["Hello", "World"]
let uppercasedCollection = collection.map { $0.uppercased() }
print(uppercasedCollection)

let lowercasedCollection = collection.map { str in str.lowercased() }
print(lowercasedCollection)

let dict = [
    "name": "SwiftUI",
    "author": "Apple Inc.",
    "ide": "Xcode"
]

let mappedDict = dict.map { (key, val) in "\(key): \(val)" }
print(mappedDict)
