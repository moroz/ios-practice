//
//  ModalView.swift
//  StateDemo
//
//  Created by Karol Moroz on 29/05/2022.
//

import SwiftUI

struct ModalView: View {
  @Environment(\.presentationMode) var presentationMode
  @Binding var count: Int

  var body: some View {
    VStack {
      Text("Modal")
        .font(.title)
        .padding()
      Spacer()
      Text(
        "Hello, I am in a modal. The current value of the counter, which I have obtained through your binding, is \(count)."
      )
      .multilineTextAlignment(.center)
      .padding()
      Button("This button can reset your counter through two-way binding") { count = 0 }
        .padding(.top)
      Spacer()
      Button("Dismiss") { presentationMode.wrappedValue.dismiss() }
        .buttonStyle(.bordered)
        .tint(.green)
        .padding()
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView(count: .constant(2137))
  }
}
