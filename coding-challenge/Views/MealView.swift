//
//  MealView.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var dessert: MealsManager
    var meal: Meals
    var body: some View {
        HStack {
            AsyncImage(
                url: meal.imageUrl,
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(maxWidth: 100, maxHeight: 50, alignment: .topLeading)
                         .clipped()
                },
                placeholder: {
                    ProgressView()
                }
            )
            Spacer()
            Text(meal.strMeal)
        }
        .padding()
    }
}

#Preview {
    MealView(meal: Meals(strMeal: "Pancakes", strMealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg", idMeal: "someId"))
        .environmentObject(MealsManager())
}
