//
//  MealDetails.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import Foundation

struct MealDetails {
    var strMeal: String
    var strInstructions: String
    var strMealThumb: String
}

// Thoughts:
// there could be something like var ingredients: [Ingredients] where I am handling the filtering of nil ingredients somewhere else
// same could be said for measurements var measurements: [Measurements] where I handle nil values
// I could even combine the measurements with the ingredients so I don't have to worry about the measurements on their own, perhaps with string interpolation
// break as soon as the nil value appears, there shouldn't be a measurement without an ingredient
// prefix is strIngredient for ingredients
// prefix is strMeasure for measurements
