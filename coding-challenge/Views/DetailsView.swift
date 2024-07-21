import SwiftUI

struct DetailsView: View {
    @StateObject var mealsDetailsManager: MealsDetailsManager
    var mealName: String
    init(idMeal: String, mealName: String) {
        self.mealName = mealName
        _mealsDetailsManager = StateObject(wrappedValue: MealsDetailsManager(idMeal: idMeal))
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, content: {
                if let details = mealsDetailsManager.mealDetails {
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
                        ForEach(0..<details.meals.first!.ingredients.count) { index in
                            Text("-\(details.meals.first!.measures[index]) \(details.meals.first!.ingredients[index])")
                        }
                    }).padding([.top, .bottom])
                    Text("Instructions").font(.title).bold()
                    Text(details.meals.first!.strInstructions)
                } else {
                    ProgressView()
                }
            })
        }
        .padding()
        .navigationTitle(mealName)
    }
}

#Preview {
    DetailsView(idMeal: "53049", mealName: "string")
}
