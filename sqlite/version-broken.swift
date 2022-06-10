import Foundation
import SQLite3

if let version = sqlite3_libversion() {
  print(version)
}
