enum Status {
    case success, failure, unknown
}

print(Status.success)

let asString = String(describing: Status.unknown)
print(asString.uppercased())
