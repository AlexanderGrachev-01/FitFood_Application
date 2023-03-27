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
        static let background = UIColor(named: "background") ?? UIColor()
        static let secondaryBackground = UIColor(named: "secondaryBackground") ?? UIColor()
        static let separator = UIColor(named: "separator") ?? UIColor()
        static let selectedDate = UIColor(named: "selectedDate") ?? UIColor()
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
    }
    
    enum Images {
        static let backButton = UIImage(named: "backButton")
        static let authBackground = UIImage(named: "authBackground")
        static let launchBackground = UIImage(named: "launchBackground")
        static let iconChevronRightGrey = UIImage(named: "iconChevronRightGrey")
        static let iconInfo = UIImage(named: "iconInfo")
        static let iconLock = UIImage(named: "iconLock")
        static let iconPerson = UIImage(named: "iconPerson")
        static let iconUnits = UIImage(named: "iconUnits")
        static let logo = UIImage(named: "logo")
    }
}
