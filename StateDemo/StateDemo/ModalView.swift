//
//  ModalView.swift
//  StateDemo
//
//  Created by Karol Moroz on 29/05/2022.
//

import SwiftUI

struct ModalView: View {
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    VStack {
      Text("Modal")
        .font(.title)
        .padding()
      Spacer()
      Text("Hello, I am in a modal")
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
    ModalView()
  }
}
