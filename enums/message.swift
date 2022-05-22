// Foundation is being imported for the Date type
import Foundation

// This is a naive implementation of a data model for
// a message application.
struct NaiveMessage {
    let userId: String
    let contents: String?
    let date: Date

    let hasJoined: Bool
    let hasLeft: Bool
    let isBeingDrafted: Bool
    let isSendingBalloons: Bool
}

// Instead of a struct, you can implement data types like this
// using enums with values (any similarity to Rust is
// coincidental...)

enum Message {
    case text(userId: String, contents: String, date: Date)
    case draft(userId: String, date: Date)
    case join(userId: String, date: Date)
    case leave(userId: String, date: Date)
    case balloon(userId: String, date: Date)
}

let textMessage = Message.text(userId: "123", contents: "Howdy!",
    date: Date())
let joinMessage = Message.join(userId: "123", date: Date())

func logMessage(message: Message) {
    switch message {
        case let .text(userId: id, contents: contents, date: date):
            print("[\(date)] User \(id) sends message: \(contents)")
        case let .draft(userId: id, date: date):
            print("[\(date)] User \(id) is drafting a message")
        case let .join(userId: id, date: date):
            print("[\(date)] User \(id) has joined the chatroom")
        case let .leave(userId: id, date: date):
            print("[\(date)] User \(id) has left the chatroom")
        case let .balloon(userId: id, date: date):
            print("[\(date)] User \(id) is sending balloons")
    }
}

logMessage(message: textMessage)
logMessage(message: joinMessage)

if case let Message.text(_, contents: contents, _) =
    textMessage {
    print("Received: \(contents)")
}
