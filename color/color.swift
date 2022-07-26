import Foundation

let string = "#fa8072"

func normalizeHex(_ hex: String) -> String? {
  guard hex.count == 6 || hex.count == 7 else {
    return nil
  }

  if hex.starts(with: "#") {
    let start = hex.index(hex.startIndex, offsetBy: 1)
    return String(hex[start...])
  }

  return hex
}

func toColor(_ hex: String) -> (Double, Double, Double) {
  let fallback = (0.0, 0.0, 0.0)

  guard let normalized = normalizeHex(string) else {
    return fallback
  }

  guard let int = Int(normalized, radix: 16) else {
    return fallback
  }

  let red = Double((int & 0xFF0000) >> 16) / 255.0
  let green = Double((int & 0xFF00) >> 8) / 255.0
  let blue = Double(int & 0xFF) / 255.0

  return (red, green, blue)
}

print(toColor(string))
