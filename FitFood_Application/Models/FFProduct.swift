//
//  FFProduct.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 22.05.2023.
//

import Foundation

struct FFProduct: Codable {
    var name: String
    var calories: Double
    var carbs: Double
    var fat: Double
    var protein: Double
    var AverageWeight: Int?
}
