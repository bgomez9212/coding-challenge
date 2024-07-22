import SwiftUI

struct DetailsView: View {
    @StateObject var mealsDetailsManager: MealsDetailsManager
    var mealName: String
    init(idMeal: String, mealName: String) {
        self.mealName = mealName
        _mealsDetailsManager = StateObject(wrappedValue: MealsDetailsManager(idMeal: idMeal))
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
        if let errorMessage = mealsDetailsManager.errorMessage {
            Text(errorMessage)
        } else if let details = mealsDetailsManager.mealDetails {
            if let meal = details.meals.first {
                ScrollView {
                    VStack (alignment: .leading, content: {
                        AsyncImageView(imageUrl: meal.strMealThumb)
                        VStack(alignment: .leading, content: {
                            Text("Ingredients").font(.title).bold()
                                ForEach(0..<meal.ingredients.count) { index in
                                    Text("-\(meal.measures[index]!) \(meal.ingredients[index]!)")
                                }
                        })
                        .padding([.top, .bottom])
                        Text("Instructions").font(.title).bold()
                        Text(details.meals.first!.strInstructions)
                    })
                }
                .padding()
                .navigationTitle(mealName)

            }
        }
    }
}

#Preview {
    DetailsView(idMeal: "53049", mealName: "string")
}
