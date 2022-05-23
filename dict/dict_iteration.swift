let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var largestKind: String? = nil

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largestKind = kind
            largest = number
        }
    }
}

print("Largest number \(largest) is a \(largestKind ?? "") number")
