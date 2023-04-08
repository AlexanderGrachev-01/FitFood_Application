//
//  Asset.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 18.02.2023.
//

import UIKit

enum Asset {
    enum Colors {
        static let white: UIColor = .white
        static let label: UIColor = .label
        static let background = UIColor(named: "background") ?? UIColor()
        static let secondaryBackground = UIColor(named: "secondaryBackground") ?? UIColor()
        static let separator = UIColor(named: "separator") ?? UIColor()
        static let selectedDate = UIColor(named: "selectedDate") ?? UIColor()
        static let blue = UIColor(named: "blue") ?? UIColor()
        static let primary50 = UIColor(named: "primary50") ?? UIColor()
        static let secondary500 = UIColor(named: "secondary500") ?? UIColor()
        static let orangeDark = UIColor(named: "orangeDark") ?? UIColor()
    }
    
    enum Strings {
        // TabBar
        static let daily = "Daily"
        static let recipes = "Recipes"
        static let lunch = "Lunch"
        static let fasting = "Fasting"
        static let settings = "Settings"
        
        static let recent = "Recent"
        static let favorites = "Favorites"
        static let logOut = "Log out"
        static let water = "Water"
        static let steps = "Steps"
    }
    
    enum Images {
        // Backgrounds
        static let authBackground = UIImage(named: "authBackground") ?? UIImage()
        static let launchBackground = UIImage(named: "launchBackground") ?? UIImage()
        static let drinkBackground = UIImage(named: "drinkBackground") ?? UIImage()
        
        // Icons
        static let backButton = UIImage(named: "iconBackButton") ?? UIImage()
        static let iconChevronRightGrey = UIImage(named: "iconChevronRightGrey") ?? UIImage()
        static let iconInfo = UIImage(named: "iconInfo") ?? UIImage()
        static let iconLock = UIImage(named: "iconLock") ?? UIImage()
        static let iconPerson = UIImage(named: "iconPerson") ?? UIImage()
        static let iconUnits = UIImage(named: "iconUnits") ?? UIImage()
        static let logo = UIImage(named: "logo") ?? UIImage()
        static let rightChevron = UIImage(named: "iconRightChevron") ?? UIImage()
        static let cup = UIImage(named: "iconCup") ?? UIImage()
        static let steps = UIImage(named: "iconSteps") ?? UIImage()
        
        // Buttons
        static let plusButton = UIImage(named: "plusButton") ?? UIImage()
        static let minusButton = UIImage(named: "minusButton") ?? UIImage()
    }
}
