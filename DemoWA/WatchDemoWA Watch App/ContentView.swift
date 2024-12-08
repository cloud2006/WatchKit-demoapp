//
//  ContentView.swift
//  WatchDemoWA Watch App
//
//  Created by Pavlo Antoniuk on 08.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            // Display the counter value
            Text("Counter: \(counter)")
                .font(.title3)
                .padding()

            // Button to increment the counter
            Button(action: {
                counter += 1  // Increment the counter
            }) {
                Text("Increase Counter")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}