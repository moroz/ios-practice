import AppKit

let x = NSAppearance.currentDrawing()
if x.name.rawValue == "NSAppearanceNameDarkAqua" {
  print("NIGHT")
} else {
  print("DAYTIME")
}
