enum StatusCode: Int {
    case OK = 200
    case Created, Accepted, NonAuthoritativeInformation, NoContent
}

print(StatusCode.Created.rawValue)
print(StatusCode.NoContent.rawValue)
