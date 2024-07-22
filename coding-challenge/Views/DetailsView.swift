import SwiftUI

struct DetailsView: View {
    @StateObject var mealsDetailsManager: MealsDetailsManager
    var mealName: String
    init(idMeal: String, mealName: String) {
        self.mealName = mealName
        _mealsDetailsManager = StateObject(wrappedValue: MealsDetailsManager(idMeal: idMeal))
    }
    
    var body: some View {
        if let errorMessage = mealsDetailsManager.errorMessage {
            Text(errorMessage)
        } else if let details = mealsDetailsManager.mealDetails {
            ScrollView {
                VStack (alignment: .leading, content: {
                    AsyncImage(
                        url: URL(string: details.meals.first!.strMealThumb),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 500, maxHeight: 300, alignment: .topLeading)
                                .clipped()
                                .cornerRadius(10)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    VStack(alignment: .leading, content: {
                        Text("Ingredients").font(.title).bold()
                        if let meals = details.meals.first {
                            ForEach(0..<meals.ingredients.count) { index in
                                Text("-\(meals.measures[index]!) \(meals.ingredients[index]!)")
                            }
                        }
                    })
                    .padding([.top, .bottom])
                    Text("Instructions").font(.title).bold()
                    Text(details.meals.first!.strInstructions)
                })
            }
            .padding()
            .navigationTitle(mealName)
        } else {
            ProgressView()
        }
    }
}

#Preview {
    DetailsView(idMeal: "53049", mealName: "string")
}
