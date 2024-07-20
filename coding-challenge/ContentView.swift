import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dessertManager: DessertsManager
    
    var body: some View {
        NavigationView {
            List {
                if let desserts = dessertManager.desserts {
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
        .environmentObject(DessertsManager())
}


