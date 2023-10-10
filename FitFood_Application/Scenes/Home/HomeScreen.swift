//
//  HomeScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit
import Nivelir

protocol HomeScreens {
    func mainScreen() -> AnyModalScreen
    func recipesScreen() -> AnyModalScreen
    func addScreen() -> AnyModalScreen
    func fastingScreen() -> AnyModalScreen
    func settingsScreen() -> AnyModalScreen
}

struct HomeScreen: Screen {

    let screens: HomeScreens

    func build(navigator: ScreenNavigator) -> UITabBarController {
        let viewController = HomeTabBarController()

        navigator.navigate(from: viewController) { route in
            route
                .setupTab(
                    with: screens
                        .mainScreen()
                        .withStackContainer()
                        .withTabBarItem(.main)
                )
                .setupTab(
                    with: screens
                        .recipesScreen()
                        .withStackContainer()
                        .withTabBarItem(.recipes)
                )
                .setupTab(
                    with: screens
                        .addScreen()
                        .withStackContainer()
                        .withTabBarItem(.add)
                )
                .setupTab(
                    with: screens
                        .fastingScreen()
                        .withStackContainer()
                        .withTabBarItem(.fasting)
                )
                .setupTab(
                    with: screens
                        .settingsScreen()
                        .withStackContainer()
                        .withTabBarItem(.settings)
                )
                .selectTab(with: .index(0))
        }

        return viewController
    }
}
