import Foundation

enum DateType {
    case singleDate(Date)
    case dateRange(Range<Date>)
}

// current time in UTC
let now = Date()
print(now)

// Unix time
let unix = Int(now.timeIntervalSince1970)
print(unix)

// Date from Unix time
let someUnixTimestamp: TimeInterval = 1401667200
let dateFromUnix = Date(timeIntervalSince1970: someUnixTimestamp)
print("Swift was first announced on \(dateFromUnix)")

// an hour from now
let hourFromNow = Date(timeIntervalSinceNow: 3600)

// an hour ago
let hourAgo = Date(timeIntervalSinceNow:  -3600)

print(hourFromNow)
print(hourAgo)

// Initialize an array of DateType structs
let dates: [DateType] = [
    // the type of the enum is annotated, so I can skip DateType
    .singleDate(now),
    // ..< operator creates a half-open date range
    .dateRange(now..<hourFromNow)
]

for dateType in dates {
    switch dateType {
        case .singleDate(let date): print("Received a date: \(date)")
        case .dateRange(let range): print("Received a range: \(range)")
    }
}

// format a Date as ISO 8601
let nowAsISOTime = ISO8601DateFormatter().string(from: now)
print(nowAsISOTime)

// parsing an ISO 8601 string as date
let isoString = "2010-04-10T21:37:00Z"

// Wrapping this expression in optional binding since it is an Optional
if let parsed = ISO8601DateFormatter().date(from: isoString) {
    print(parsed)
}

// formatting a Date using preset formats
let dateFormatter = DateFormatter()
print(dateFormatter.timeStyle)
print(dateFormatter.dateStyle)

print(dateFormatter.string(from: now))

dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .medium
print(dateFormatter.string(from: now))

dateFormatter.dateStyle = .long
dateFormatter.timeStyle = .long
print(dateFormatter.string(from: now))

dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
print(dateFormatter.string(from: now))

// Default locale (English?)
// May 21, 2022
print(dateFormatter.string(from: now))

// Set a custom locale
dateFormatter.locale = Locale(identifier: "zh_TW")
// 2022年5月21日
print(dateFormatter.string(from: now))

dateFormatter.locale = Locale(identifier: "zh_CN")
print(dateFormatter.string(from: now))

dateFormatter.locale = Locale(identifier: "pl_PL")
print(dateFormatter.string(from: now))
