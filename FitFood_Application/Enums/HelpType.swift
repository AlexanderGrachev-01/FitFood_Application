//
//  HelpType.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import Foundation

enum HelpType {
    case countCalories
    case activityTracker
    case healthyNutrition
    case statistics
    case waterBalance
    
    var description: String {
        switch self {
        case .countCalories:
            return Asset.Strings.countingCalories
        case .activityTracker:
            return Asset.Strings.activityTracker
        case .healthyNutrition:
            return Asset.Strings.healthyEating
        case .statistics:
            return Asset.Strings.analyticsAndStatistics
        case .waterBalance:
            return Asset.Strings.maintainingWaterBalance
        }
    }
}
