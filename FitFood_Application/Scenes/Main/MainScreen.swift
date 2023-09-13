//
//  MainScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.09.2023.
//

import Nivelir
import UIKit

protocol MainScreens {}

struct MainScreen: Screen {

    let screens: MainScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
//        let viewModel =
        let viewController = FFDailyViewController()
        return viewController
    }
}
