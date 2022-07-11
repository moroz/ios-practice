import Foundation

let amount = NSNumber(2137)
let formatter = NumberFormatter()

formatter.numberStyle = .currency
formatter.locale = Locale(identifier: "zh-TW")
formatter.currencyCode = "TWD"
formatter.maximumFractionDigits = 0

if let formatted = formatter.string(from: amount) {
  print(formatted)
}
