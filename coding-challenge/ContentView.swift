import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dessertManager: DessertsManager
    
    var body: some View {
        NavigationView {
            List {
                if let desserts = dessertManager.desserts {
                    ForEach(desserts.meals, id: \.idMeal) { dessert in
                        NavigationLink {
                            DetailsView(idMeal: dessert.idMeal)
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


