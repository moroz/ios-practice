//
//  DataStore.swift
//  SQLiteTest
//
//  Created by Karol Moroz on 01/06/2022.
//

import Foundation
import SQLite3

let tutorialDirectoryUrl = try? FileManager.default.url(
  for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

class DataStore: ObservableObject {
  var dbPath: String? {
    tutorialDirectoryUrl?.appendingPathComponent("store.db").relativePath
  }

  private var db: OpaquePointer?
  private(set) var dbOpen = false

  init() {
    if let _ = openDatabase() {
      if !tableExists(tableName: "Contact") {
        createTable()
      }
    }
  }

  func openDatabase() -> OpaquePointer? {
    print(tutorialDirectoryUrl ?? "")
    guard let dbPath = dbPath else {
      print("dbPath is nil.")
      return nil
    }
    guard !dbOpen, db == nil else {
      return db
    }

    if sqlite3_open(dbPath, &db) == SQLITE_OK {
      print("Successfully opened db at path \(dbPath)")
      dbOpen = true
      return db
    } else {
      print("Unable to open database.")
      return nil
    }
  }

  func tableExists(tableName: String) -> Bool {
    guard let db = db, dbOpen else {
      return false
    }
    var statement: OpaquePointer?

    let queryString = "select name from sqlite_master where type = 'table' and name = ?;"
    if sqlite3_prepare_v2(db, queryString, -1, &statement, nil) == SQLITE_OK {
      sqlite3_bind_text(statement, 1, tableName, -1, nil)
      let result = sqlite3_step(statement)
      sqlite3_finalize(statement)
      return result == SQLITE_ROW
    }
    return false
  }

  private let createTableString = """
    create table Contact(
      id int primary key not null,
      name char(255)
    );
    """

  func createTable() {
    var createTableStatement: OpaquePointer?
    if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
      if sqlite3_step(createTableStatement) == SQLITE_DONE {
        print("\nContact table created.")
      } else {
        print("\nContact table could not be created.")
      }
    } else {
      print("\nCould not prepare CREATE TABLE statement.")
    }
    sqlite3_finalize(createTableStatement)
  }
}
