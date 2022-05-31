//
//  CounterView.swift
//  StateDemo
//
//  Created by Karol Moroz on 29/05/2022.
//

import SwiftUI

struct CounterView: View {
  @State private var count = 0
  @State private var modalShown = false

  var body: some View {
    ZStack {
      HStack {
        Button("-") { count -= 1 }
          .buttonStyle(.bordered)
          .tint(.red)

        Text(String(count))
          .frame(width: 50.0, height: 25.0)
          .padding()

        Button("+") { count += 1 }
          .buttonStyle(.bordered)
          .tint(.mint)
      }
      VStack {
        Spacer()
        Button(
          action: { count = 0 },
          label: {
            Text("Reset")
              .frame(width: 100.0, height: 25.0)
          }
        )
        .buttonStyle(.bordered)
        .tint(.blue)
        Spacer()
          .frame(height: 150.0)
        Button("Show modal") { modalShown.toggle() }
          .padding(.bottom)
          .sheet(isPresented: $modalShown) {
            ModalView(count: $count)
          }
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView()
  }
}
