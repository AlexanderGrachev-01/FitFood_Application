//
//  OnboardingVCType.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

enum OnboardingType {
    case gender
    case age
    case height
    case target
    case weight
    case activity
    case help
    case nutrition
        
    var image: UIImage {
        switch self {
        case .gender:
            return Asset.Images.onboarding1
        case .age:
            return Asset.Images.onboarding6
        case .height:
            return Asset.Images.onboarding3
        case .target:
            return Asset.Images.onboarding4
        case .weight:
            return Asset.Images.onboarding5
        case .activity:
            return Asset.Images.onboarding2
        case .help:
            return Asset.Images.onboarding7
        case .nutrition:
            return Asset.Images.onboarding8
        }
    }
    
    var nextType: OnboardingType {
        switch self {
        case .gender:
            return .age
        case .age:
            return .height
        case .height:
            return .target
        case .target:
            return .weight
        case .weight:
            return .activity
        case .activity:
            return .help
        case .help:
            return .nutrition
        case .nutrition:
            return .gender
        }
    }
}
