//
//  DatabaseView.swift
//  SQLiteTest
//
//  Created by Karol Moroz on 01/06/2022.
//

import SwiftUI

struct DatabaseView: View {
  @EnvironmentObject var store: DataStore

  var body: some View {
    VStack {
      Text("Hello, World!")
      Text(store.dbPath ?? "")
    }
  }
}

struct DatabaseView_Previews: PreviewProvider {
  static var previews: some View {
    DatabaseView()
  }
}
