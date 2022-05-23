import Foundation

let myDict = [
    "PL": "PLN",
    "CZ": "CZK",
    "SK": "EUR"
]

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let jsonData = try encoder.encode(myDict)
if let json = String(data: jsonData, encoding: .utf8) {
    print(json)
}

