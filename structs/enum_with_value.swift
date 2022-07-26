enum Role: String {
    case regular = "REGULAR"
    case admin = "ADMIN"
}

let adminRole = Role.admin
print(adminRole.rawValue)
// ADMIN
print(String(describing: adminRole))
// admin

// casting String to enum
if let fromString = Role(rawValue: "ADMIN") {
    print(fromString)
    // admin
}

let willFail = Role(rawValue: "NO CAN DO")
print(willFail as Any)
// nil
