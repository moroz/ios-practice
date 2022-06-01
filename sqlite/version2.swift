import Foundation
import SQLite3

func formatError(db: OpaquePointer?) -> String? {
  if let raw_errmsg = sqlite3_errmsg(db) {
    return String(cString: raw_errmsg)
  }
  return nil
}

var db: OpaquePointer?
var res: OpaquePointer?

var rc = sqlite3_open(":memory:", &db)

if rc != SQLITE_OK {
  if let msg = formatError(db: db) {
    fputs("Cannot open database: \(msg)", stderr)
  }
  exit(1)
}

rc = sqlite3_prepare_v2(db, "select sqlite_version()", -1, &res, nil)

if rc != SQLITE_OK {
  if let msg = formatError(db: db) {
    fputs("Failed to fetch data: \(msg)", stderr)
  }
  sqlite3_close(db)
  exit(1)
}

rc = sqlite3_step(res)

if rc == SQLITE_ROW, let str = sqlite3_column_text(res, 0) {
  print(String(cString: str))
}

sqlite3_finalize(res)
sqlite3_close(db)

exit(0)
