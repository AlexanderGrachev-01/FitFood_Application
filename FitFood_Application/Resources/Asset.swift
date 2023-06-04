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
        static let background = UIColor(named: "background") ?? .white
        static let secondaryBackground = UIColor(named: "secondaryBackground") ?? .white
        static let separator = UIColor(named: "separator") ?? .white
        static let selectedDate = UIColor(named: "selectedDate") ?? .white
        static let blue = UIColor(named: "blue") ?? .white
        static let primary50 = UIColor(named: "primary50") ?? .white
        static let secondary500 = UIColor(named: "secondary500") ?? .white
        static let orangeDark = UIColor(named: "orangeDark") ?? .white
        static let green = UIColor(named: "green") ?? .white
        static let lightGreen = UIColor(named: "lightGreen") ?? .white
        static let lightBlue = UIColor(named: "lightBlue") ?? .white
        static let orange = UIColor(named: "orange") ?? .white
        static let lightOrange = UIColor(named: "lightOrange") ?? .white
        static let progressFat = UIColor(named: "progressFat") ?? .white
        static let progressFatLight = UIColor(named: "progressFatLight") ?? .white
        static let arcProgressViewBackground = UIColor(named: "arcProgressViewBackground") ?? .white
        static let arcProgressView = UIColor(named: "arcProgressView") ?? .white
        static let darkBlue = UIColor(named: "darkBlue") ?? .white
        static let categoryCellBackground = UIColor(named: "categoryCellBackground") ?? .white
        static let lightGray = UIColor(named: "lightGray") ?? .white
        static let errorRed = UIColor(named: "errorRed") ?? .white
        static let fatingTypeViewBackground = UIColor(named: "fatingTypeViewBackground") ?? .white
        static let paleGreen = UIColor(named: "paleGreen") ?? .white
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
        static let hide = "Hide"
        static let done = "Done"
        static let addYourDish = "Add your own dish"
        static let fillTheField = "Fill in the field"
        static let chooseIntervalPlan = "Choose an interval fasting plan"
        static let aboutIntermittentFasting = "About Intermittent Fasting"
        static let loseWeight = "Lose weight"
        static let intervals = "Intervals"
        static let health = "Health"
        static let drinks = "Drinks"
        static let activity = "Activity"
        static let yourFasting = "Your Fasting"
        static let eating = "Eating"
        static let start = "Start"
        static let finishPlan = "Finish (according to plan):"
        static let curent = "Curent"
        static let longest = "Longest"
        static let all = "All"
        static let total = "Total"
        static let choosePlanToStartFasting = "Choose a plan to start fasting"
        static let hOfFasting = "h. fasting"
        static let hOfMeal = "h. meal period"
        static let startFasting = "Start fasting"
        static let difficultyLevel = "Difficulty level"
        static let countingCalories = "Counting calories"
        static let activityTracker = "Activity tracker"
        static let healthyEating = "Healthy eating"
        static let analyticsAndStatistics = "Analytics and statistics"
        static let maintainingWaterBalance = "Maintaining water balance"
        static let next = "Next"
        static let specifyYourGender = "Specify your gender"
        static let weNeedGenderToCalculateCalorie = "We need to know your gender in order to correctly calculate your daily calorie requirement"
        static let specifyYourAge = "Specify your age"
        static let years = "years"
        static let specifyYourHeight = "Specify your height"
        static let cm = "cm"
        static let yourMainGoal = "Your main goal"
        static let maintainWeight = "Maintain current weight"
        static let gainWeight = "Gain weight"
        static let buildMuscle = "Build muscle"
        static let specifyCurrentWeight = "Specify your current weight"
        static let kg = "kg"
        static let specifyDesiredWeight = "Specify your desired weight"
        static let indicateYourActivity = "Indicate your activity"
        static let levelOfActivityHelpCalculateCalorie = "The level of your daily activity will help you calculate your calorie requirement more accurately"
        static let slightlyActive = "Slightly active"
        static let moderatelyActive = "Moderately active"
        static let active = "Active"
        static let veryActive = "Very active"
        static let howCanAppHelp = "How can our app help you?"
        static let specifyTypeOfFood = "Specify the type of food you want to stick to"
        static let recommendationsOfRecipesYourPreferences = "Recommendations of recipes of dishes will be selected according to your preferences"
        static let classic = "Classic"
        static let pescetarianism = "Pescetarianism"
        static let vegetarianism = "Vegetarianism"
        static let veganism = "Veganism"
        static let female = "Female"
        static let male = "Male"
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
        static let checkboxEmpty = UIImage(named: "checkboxEmpty") ?? UIImage()
        static let checkboxFilled = UIImage(named: "checkboxFilled") ?? UIImage()
        
        // Views
        static let protein = UIImage(named: "proteinImage") ?? UIImage()
        static let fat = UIImage(named: "fatImage") ?? UIImage()
        static let carbs = UIImage(named: "carbsImage") ?? UIImage()
        static let fire = UIImage(named: "iconFire") ?? UIImage()
        
        // Cells
        static let dishPhoto = UIImage(named: "dishPhoto") ?? UIImage()
        static let banana = UIImage(named: "banana") ?? UIImage()
        static let bread = UIImage(named: "bread") ?? UIImage()
        static let broccoli = UIImage(named: "broccoli") ?? UIImage()
        static let cookie = UIImage(named: "cookie") ?? UIImage()
        static let eggs = UIImage(named: "eggs") ?? UIImage()
        static let fish = UIImage(named: "fish") ?? UIImage()
        static let meatOnBone = UIImage(named: "meatOnBone") ?? UIImage()
        static let milkCarton = UIImage(named: "milkCarton") ?? UIImage()
        static let mushrooms = UIImage(named: "mushrooms") ?? UIImage()
        static let peanuts = UIImage(named: "peanuts") ?? UIImage()
        static let soy = UIImage(named: "soy") ?? UIImage()
        static let spaghetti = UIImage(named: "spaghetti") ?? UIImage()
        static let rightGreenChevron = UIImage(named: "rightGreenChevron") ?? UIImage()
        static let fastingConfig = UIImage(named: "fastingConfig") ?? UIImage()
        static let drinks = UIImage(named: "drinks") ?? UIImage()
        static let health = UIImage(named: "health") ?? UIImage()
        static let intervals = UIImage(named: "intervals") ?? UIImage()
        static let weight = UIImage(named: "weight") ?? UIImage()

        static let biceps = UIImage(named: "biceps") ?? UIImage()
        static let checkMark = UIImage(named: "checkMark") ?? UIImage()
        static let clock = UIImage(named: "clock") ?? UIImage()
        static let fireCur = UIImage(named: "fireCur") ?? UIImage()

        // Onboarding
        static let onboarding1 = UIImage(named: "onboarding1") ?? UIImage()
        static let onboarding2 = UIImage(named: "onboarding2") ?? UIImage()
        static let onboarding3 = UIImage(named: "onboarding3") ?? UIImage()
        static let onboarding4 = UIImage(named: "onboarding4") ?? UIImage()
        static let onboarding5 = UIImage(named: "onboarding5") ?? UIImage()
        static let onboarding6 = UIImage(named: "onboarding6") ?? UIImage()
        static let onboarding7 = UIImage(named: "onboarding7") ?? UIImage()
        static let onboarding8 = UIImage(named: "onboarding8") ?? UIImage()
    }
}
