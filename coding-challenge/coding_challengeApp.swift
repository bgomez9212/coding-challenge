//
//  coding_challengeApp.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import SwiftUI

@main
struct coding_challengeApp: App {
    var dessertsManager = DessertsManager()
//    var mealsDetailsManager = MealsDetailsManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dessertsManager)
//                .environmentObject(mealsDetailsManager)
        }
    }
}
