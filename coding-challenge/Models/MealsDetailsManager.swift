//
//  MealsDetailsManager.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import Foundation

class MealsDetailsManager: ObservableObject {
    @Published var mealDetails: MealsDetailsResponse?
    private var idMeal: String
    init(idMeal: String) {
        self.idMeal = idMeal
        Task {
            await loadDetails()
        }
    }
    func loadDetails() async {
        do {
            mealDetails = try await getDetails(idMeal: idMeal)
        } catch DetailsError.invalidUrl {
            print("invalid url")
        } catch DetailsError.invalidResponse {
            print("invalid response")
        } catch DetailsError.invalidData {
            print("invalid data")
        } catch {
            print("unexpected error")
        }
    }
}

func getDetails(idMeal: String) async throws -> MealsDetailsResponse {
    let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
    guard let apiUrl = URL(string: endpoint) else {
        throw DetailsError.invalidUrl
    }
    
    let (data, response) = try await URLSession.shared.data(from: apiUrl)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw DetailsError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(MealsDetailsResponse.self, from: data)
    } catch {
        throw DetailsError.invalidData
    }
}

enum DetailsError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
