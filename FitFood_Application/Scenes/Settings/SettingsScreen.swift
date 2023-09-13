//
//  SettingsScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.09.2023.
//

import Nivelir
import UIKit

protocol SettingsScreens {}

struct SettingsScreen: Screen {

    let screens: SettingsScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
//        let viewModel
        let viewController = FFSettingsViewController()
        return viewController
    }
}
