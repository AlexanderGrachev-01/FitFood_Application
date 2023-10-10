//
//  RecipesScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.09.2023.
//

import Nivelir
import UIKit

protocol RecipesScreens {}

struct RecipesScreen: Screen {

    let screens: RecipesScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
//        let viewModel
        let viewController = FFRecipesViewController()
        return viewController
    }
}
