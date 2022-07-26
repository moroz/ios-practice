import Foundation

private let regex = try! NSRegularExpression(pattern: "[^A-Fa-f0-9]")

private func normalizeHex(_ hex: String) -> String? {
  let range = NSRange(location: 0, length: hex.length)
  let replaced = regex.stringByReplacingMatches(in: hex, range: range, withTemplate: "")

  if replaced.count == 3 {
    return replaced.map { char in String(repeating: char, count: 2) }.joined()
  }

  if replaced.count == 6 {
    return replaced
  }

  return nil
}

if let normalized = normalizeHex("#fff") {
  print(normalized)
}
