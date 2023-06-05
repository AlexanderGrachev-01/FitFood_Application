//
//  RecipeCategory.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 05.06.2023.
//

import Foundation

enum RecipeCategory: String, CaseIterable, Codable {
    case title = "Title"
    case fruits = "Fruits"
    case meat = "Meat"
    case vegetables = "Vegetables"
    case bread = "Bread"
    case nuts = "Nuts"
    case fish = "Fish"
    case mushrooms = "Mushrooms"
    case eggs = "Eggs"
    case milk = "Milk"
    case dessert = "Dessert"
    case pasta = "Pasta"
    case legumes = "Legumes"
}
