//
//  Screens.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import Foundation
import Nivelir

struct Screens { }

extension Screens: RootScreens {
    func showSplashRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: SplashScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: SplashScreens {
    func showAuthRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
    }

    func showHomeRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: HomeScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: HomeScreens {
    func mainScreen() -> AnyModalScreen {
        MainScreen(screens: self)
            .eraseToAnyScreen()
    }

    func recipesScreen() -> AnyModalScreen {
        RecipesScreen(screens: self)
            .eraseToAnyScreen()
    }

    func addScreen() -> AnyModalScreen {
        AddingScreen(screens: self)
            .eraseToAnyScreen()
    }

    func fastingScreen() -> AnyModalScreen {
        FastingScreen(screens: self)
            .eraseToAnyScreen()
    }

    func settingsScreen() -> AnyModalScreen {
        SettingsScreen(screens: self)
            .eraseToAnyScreen()
    }
}

extension Screens: MainScreens {}

extension Screens: RecipesScreens {}

extension Screens: AddingScreens {}

extension Screens: FastingScreens {}

extension Screens: SettingsScreens {}
