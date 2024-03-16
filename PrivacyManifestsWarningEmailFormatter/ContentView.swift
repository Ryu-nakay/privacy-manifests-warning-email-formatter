//
//  ContentView.swift
//  PrivacyManifestsWarningEmailFormatter
//
//  Created by 中山龍 on 2024/03/16.
//

import SwiftUI

struct ContentView: View {
    @State var inputText = ""
    @State var result = ""

    var body: some View {
        VStack {
            HStack {
                TextEditor(text: $inputText)
                    .padding()

                Text("→")

                TextEditor(text: $result)
                    .padding()
            }

            Button {
                result = EmailFormatter().format(from: inputText)
            } label: {
                Text("Format")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
