//
//  Meal.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import Foundation

struct Meals: Decodable, Identifiable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
    var id: String {
        return self.idMeal
    }
    
    var imageUrl: URL {
        URL(string: self.strMealThumb)!
    }
}

struct MealsResponse: Decodable {
    var meals: [Meals]
}