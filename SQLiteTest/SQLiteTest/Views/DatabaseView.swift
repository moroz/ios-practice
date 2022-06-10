//
//  DatabaseView.swift
//  SQLiteTest
//
//  Created by Karol Moroz on 01/06/2022.
//

import SwiftUI

struct DatabaseView: View {
  @EnvironmentObject var store: DataStore

  func insertUser() {
    let result = store.insertContact(
      Contact(name: "Test User", email: "test@example.com", phone: nil))
    if result {
      print("Contact inserted")
    } else {
      print("could not insert")
    }
  }

  var body: some View {
    VStack {
      Text("Hello, World!")
      Text(store.dbPath ?? "")
      Button("Insert a user") { insertUser() }
    }
  }
}

struct DatabaseView_Previews: PreviewProvider {
  static var previews: some View {
    DatabaseView()
  }
}
