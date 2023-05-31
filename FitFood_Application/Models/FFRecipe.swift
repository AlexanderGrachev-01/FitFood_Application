//
//  FFRecipe.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 29.05.2023.
//

import Foundation

struct FFRecipe: Codable {
    var name: String
    var kcal: Int
    var protein: Double
    var fat: Double
    var carbs: Double
    var ingredients: [String]
    var cookingSteps: [FFCookingStep]
}
