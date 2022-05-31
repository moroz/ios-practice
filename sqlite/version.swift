import Foundation
import SQLite3

if let version = sqlite3_libversion() {
  let str = String(cString: version)
  print(str)
}
