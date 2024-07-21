//
//  DessertsManager.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import Foundation

class MealsManager: ObservableObject {
    @Published var desserts: MealsResponse?
    init() {
        Task {
            await loadDesserts()
        }
    }
    func loadDesserts() async {
        do {
            desserts = try await getDesserts()
        } catch ApiError.invalidUrl {
            print("invalid Url")
        } catch ApiError.invalidResponse {
            print("invalid response")
        } catch ApiError.invalidData {
            print("invalid data")
        } catch {
            print("unexpected error")
        }
    }
}

func getDesserts() async throws -> MealsResponse {
    let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=dessert"
    guard let apiUrl = URL(string: endpoint) else {
        throw ApiError.invalidUrl
    }
    
    let (data, response) = try await URLSession.shared.data(from: apiUrl)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw ApiError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(MealsResponse.self, from: data)
    } catch {
        throw ApiError.invalidData
    }
}

enum ApiError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
