import SwiftUI

struct DetailsView: View {
    @StateObject var mealsDetailsManager: MealsDetailsManager
    
    init(idMeal: String) {
        _mealsDetailsManager = StateObject(wrappedValue: MealsDetailsManager(idMeal: idMeal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let details = mealsDetailsManager.mealDetails {
                    AsyncImage(
                        url: URL(string: details.meals.first!.strMealThumb),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 500, maxHeight: 300, alignment: .topLeading)
                                .clipped()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Text(details.meals.first!.strMeal)
                        .font(.largeTitle)
                    Text(details.meals.first!.strInstructions)
                } else {
                    ProgressView()
                }
            }
        }.padding()
    }
}

#Preview {
    DetailsView(idMeal: "53049")
}
