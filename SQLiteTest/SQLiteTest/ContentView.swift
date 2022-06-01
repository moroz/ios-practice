//
//  ContentView.swift
//  SQLiteTest
//
//  Created by Karol Moroz on 01/06/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    DatabaseView()
      .padding()
      .environmentObject(DataStore())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(DataStore())
  }
}
