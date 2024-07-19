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
                if let desserts = dessertManager.desserts {
                    ForEach(desserts.meals, id: \.idMeal) { dessert in
                        Text(dessert.strMeal)
                    }
                } else {
                    Text("Loading desserts...")
                }
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DessertsManager())
}

