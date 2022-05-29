//
//  CounterView.swift
//  StateDemo
//
//  Created by Karol Moroz on 29/05/2022.
//

import SwiftUI

struct CounterView: View {
  @State private var count = 0

  var body: some View {
    HStack {
        Button("-") { count -= 1 }
            .buttonStyle(.bordered)
            .tint(.red)

      Text(String(count))
        .padding()

      Button("+") { count += 1 }
            .buttonStyle(.bordered)
            .tint(.mint)
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView()
  }
}
