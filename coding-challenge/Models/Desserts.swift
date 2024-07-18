//
//  Desserts.swift
//  coding-challenge
//
//  Created by Brandon Gomez on 7/18/24.
//

import Foundation

struct Desserts: Decodable {
    var meals: [Meals]
}

// meals should be sorted alphabetically (it appears this is the defaut behavior at https://www.themealdb.com/api/json/v1/1/filter.php?c=dessert
