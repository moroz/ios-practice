import Foundation

struct User {
    let id: String
    var name: String {
        didSet {
            self.name = self.name.trimmingCharacters(in: .whitespaces)
        }
    }

    init(name: String) {
        defer { self.name = name }
        self.id = UUID.init().uuidString.lowercased()
        self.name = ""
    }
}

var newUser = User(name: "   Test   ")
print(newUser)

newUser.name = "   A changed value "
print(newUser)
