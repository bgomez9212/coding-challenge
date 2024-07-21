import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mealsManager: MealsManager
    
    var body: some View {
        NavigationView {
            List {
                if let desserts = mealsManager.desserts {
                    ForEach(desserts.meals) { dessert in
                        NavigationLink {
                            DetailsView(idMeal: dessert.idMeal, mealName: dessert.strMeal)
                        } label: {
                            Text(dessert.strMeal)
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MealsManager())
}


