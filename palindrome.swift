import Foundation

func isPalindrome(_ str: String) -> Bool {
    return String(str.reversed()) == str
}

if CommandLine.arguments.count == 1 {
    print("Usage: palindrome WORD")
    exit(0)
}

for word in CommandLine.arguments.suffix(from: 1) {
    if isPalindrome(word) {
        print("\(word) is a palindrome!")
    } else {
        print("\(word) is not a palindrome.")
    }
}
