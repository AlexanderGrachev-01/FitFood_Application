//
//  AddingScreen.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.09.2023.
//

import Nivelir
import UIKit

protocol AddingScreens {}

struct AddingScreen: Screen {

    let screens: AddingScreens

    func build(navigator: ScreenNavigator) -> UIViewController {
//        let viewModel
        let viewController = FFAddingViewController()
        return viewController
    }
}
