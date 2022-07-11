// Foundation extends String with the `capitalized`
// computed property
import Foundation

// defining an enum with corresponding String values
enum FellowshipMember: String {
    case gandalf = "You shall not pass!"
    case frodo = "Okay, then. Keep your secrets."

    func showYourself() {
        let label = String(describing: self).capitalized
        print("\(label) said, \"\(self.rawValue)\"")
    }

    var spongeBobCased: String {
        let converted = self.rawValue.unicodeScalars.enumerated().map { (index, char) -> String in
            let str = String(char)
            if index % 2 == 0 {
                return str.lowercased()
            } else {
                return str.uppercased()
            }
        }
        return converted.joined()
    }
}

print(FellowshipMember.gandalf.spongeBobCased)
print(FellowshipMember.frodo.spongeBobCased)

FellowshipMember.frodo.showYourself()
FellowshipMember.gandalf.showYourself()
