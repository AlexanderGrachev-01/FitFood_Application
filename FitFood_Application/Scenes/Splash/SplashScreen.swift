//
//  SplashScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit
import Nivelir

protocol SplashScreens {
    func showAuthRoute() -> ScreenWindowRoute
    func showHomeRoute() -> ScreenWindowRoute
}

struct SplashScreen: Screen {

    let screens: SplashScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
        UIViewController()
    }
}
