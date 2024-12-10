//
//  ContentView.swift
//  DemoWA
//
//  Created by Pavlo Antoniuk on 04.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    let connectivity = iOSConnectivity.shared
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.title)
                .padding()
            HStack {
                Button(action: {
                    counter += 1  // Increment the counter
                    connectivity.sendInt(counter)
                }) {
                    Text("+")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                
                Button(action: {
                    counter -= 1  // Decrement the counter
                    connectivity.sendInt(counter)
                }) {
                    Text("-")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
            }
        }
        .padding()
        .onAppear {
            connectivity.counterUpdated = { newCounter in
                DispatchQueue.main.async {
                    self.counter = newCounter
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
