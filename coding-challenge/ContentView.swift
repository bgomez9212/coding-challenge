//
//  ContentView.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dessertManager: DessertsManager
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
}
