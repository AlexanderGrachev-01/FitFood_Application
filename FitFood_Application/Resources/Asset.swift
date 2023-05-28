//
//  Asset.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 18.02.2023.
//

import UIKit

enum Asset {
    // MARK: - Colors
    
    enum Colors {
        // BTW
        static let btw400 = UIColor(named: "btw400")
        
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
        static let green = UIColor(named: "green") ?? UIColor()
        static let lightGreen = UIColor(named: "lightGreen") ?? UIColor()
        static let lightBlue = UIColor(named: "lightBlue") ?? UIColor()
        static let orange = UIColor(named: "orange") ?? UIColor()
        static let lightOrange = UIColor(named: "lightOrange") ?? UIColor()
        static let progressFat = UIColor(named: "progressFat") ?? UIColor()
        static let progressFatLight = UIColor(named: "progressFatLight") ?? UIColor()
        static let arcProgressViewBackground = UIColor(named: "arcProgressViewBackground") ?? UIColor()
        static let arcProgressView = UIColor(named: "arcProgressView") ?? UIColor()
        static let darkBlue = UIColor(named: "darkBlue") ?? UIColor()
        static let categoryCellBackground = UIColor(named: "categoryCellBackground") ?? UIColor()
        static let lightGray = UIColor(named: "lightGray") ?? UIColor()
        static let errorRed = UIColor(named: "errorRed") ?? UIColor()
    }
    
    // MARK: - Strings
    
    enum Strings {
        static let daily = "Daily"
        static let recipes = "Recipes"
        static let fasting = "Fasting"
        static let settings = "Settings"
        static let recent = "Recent"
        static let favorites = "Favorites"
        static let logOut = "Log out"
        static let water = "Water"
        static let steps = "Steps"
        static let eaten = "Eaten"
        static let breakfast = "Breakfast"
        static let lunch = "Lunch"
        static let dinner = "Dinner"
        static let snack = "Snack"
        static let protein = "Protein"
        static let fat = "Fat"
        static let carbs = "Carbs"
        static let timeToStrave = "Time to strave"
        static let timeToEat = "Time to eat"
        static let popularMenus = "Popular menus"
        static let seeAll = "See all"
        static let done = "Done"
        static let addYourDish = "Add your own dish"
        static let fillTheField = "Fill in the field"
    }
    
    // MARK: - Images
    
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
        static let blackFire = UIImage(named: "iconBlackFire") ?? UIImage()
        static let personBlack = UIImage(named: "iconPersonBlack") ?? UIImage()
        static let star = UIImage(named: "iconStar") ?? UIImage()
        static let starFill = UIImage(named: "iconStarFill") ?? UIImage()
        static let plus = UIImage(named: "iconPlus") ?? UIImage()
        
        // Buttons
        static let plusButton = UIImage(named: "plusButton") ?? UIImage()
        static let minusButton = UIImage(named: "minusButton") ?? UIImage()
        static let checkRadio = UIImage(named: "checkRadio") ?? UIImage()
        static let checkRadioSelected = UIImage(named: "checkRadioSelected") ?? UIImage()
        
        // Views
        static let protein = UIImage(named: "proteinImage") ?? UIImage()
        static let fat = UIImage(named: "fatImage") ?? UIImage()
        static let carbs = UIImage(named: "carbsImage") ?? UIImage()
        static let fire = UIImage(named: "iconFire") ?? UIImage()
        
        // Cells
        static let dishPhoto = UIImage(named: "dishPhoto") ?? UIImage()
        static let banana = UIImage(named: "banana") ?? UIImage()
    }
}
