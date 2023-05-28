//
//  FFUser.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.01.2023.
//

import Foundation

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
