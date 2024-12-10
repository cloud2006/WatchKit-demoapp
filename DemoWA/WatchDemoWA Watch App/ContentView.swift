//
//  ContentView.swift
//  WatchDemoWA Watch App
//
//  Created by Pavlo Antoniuk on 08.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    let connectivity = watchOSConnectivity.shared
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.title3)
                .padding()

            HStack {
                Button(action: {
                    counter += 1  // Increment the counter
                    connectivity.sendInt(counter)
                }) {
                    Text("+")
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    counter -= 1  // Decrement the counter
                    connectivity.sendInt(counter)
                }) {
                    Text("-")
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
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
