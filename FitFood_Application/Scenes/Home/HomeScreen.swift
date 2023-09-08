//
//  HomeScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit
import Nivelir

protocol HomeScreens {}

struct HomeScreen: Screen {

    let screens: HomeScreens

    func build(navigator: ScreenNavigator) -> UITabBarController {
        let viewController = UITabBarController()
        return viewController
    }
}
