import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mealsManager: MealsManager
    
    var body: some View {
        if let error = mealsManager.errorMessage {
            Text(error)
        } else if let desserts = mealsManager.desserts {
            NavigationView {
                List {
                    ForEach(desserts.meals) { dessert in
                        NavigationLink {
                            DetailsView(idMeal: dessert.idMeal, mealName: dessert.strMeal)
                        } label: {
                            Text(dessert.strMeal)
                        }
                    }
                }
                .navigationTitle("Desserts")
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MealsManager())
}


