let my_vec: [Int?] = [2137, nil]

for value in my_vec {
    if let val = value {
        print("Encountered an Int: \(val)")
    } else {
        print("No value here")
    }
}
