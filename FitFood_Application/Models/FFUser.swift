//
//  FFUser.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.01.2023.
//

import Foundation

struct FFUser: Codable {
    var id: String
    var firstName: String
    var lastName: String
    var gender: FFGender
    var height: Int
    var weight: Double
    var desiredWeight: Double
    var age: Int
    var activityFactor: FFActivityFactor
    var breakfast: [FFProduct]
    var lunch: [FFProduct]
    var diner: [FFProduct]
    var snaks: [FFProduct]
    var favoritesProducts: [FFProduct]
}
