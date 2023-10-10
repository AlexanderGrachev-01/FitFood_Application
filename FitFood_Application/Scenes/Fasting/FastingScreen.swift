//
//  FastingScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.09.2023.
//

import Nivelir
import UIKit

protocol FastingScreens {}

struct FastingScreen: Screen {

    let screens: FastingScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
//        let viewModel =
        let viewController = FFFastingViewController()
        return viewController
    }
}
