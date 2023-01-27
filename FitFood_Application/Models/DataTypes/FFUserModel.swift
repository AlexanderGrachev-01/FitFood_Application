//
//  FFUserModel.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.01.2023.
//

import Foundation

enum FFGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case unknown = "unknown"
}

enum FFActivityFactor: Double, Codable {
    case a1 = 1.2
    case a2 = 1.38
    case a3 = 1.46
    case a4 = 1.55
    case a5 = 1.65
    case a6 = 1.73
    case a7 = 1.9
}

struct FFUser: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let gender: FFGender
    let height: Int
    let weight: Int
    let age: Int
    let activityFactor: FFActivityFactor
}
