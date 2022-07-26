import Foundation

let today = Date()

extension Date {
  var dateString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd"
    return formatter.string(from: self)
  }
}

print(today.dateString)
