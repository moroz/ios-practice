let array: [String?] = [.some("Hello world!"), .none]

for elem in array {
  switch elem {
  case let .some(str):
    print("String found: \(str)")
  case .none:
    print("No string here!")
  }
}
