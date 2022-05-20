import UIKit

// var defines a mutable variable
// String type is called String
var greeting = "Hello, playground"

// let defines an immutable variable
// Defaults to Int type (i32?)
let x = 10
let y = 20

x + y

let double = 21.37

let uppercaseGreeting = greeting.uppercased()

let reversed = String("deified".reversed())

func isPalindrome(_ str: String) -> Bool {
    let reversed = String(str.reversed())
    return reversed == str
}

isPalindrome("deified")

isPalindrome("abacad")

// convert any (?) value to String
String(21.37)

// string interpolation
let msg = "How much is a bottle of cheap wine? \(double) PLN"
