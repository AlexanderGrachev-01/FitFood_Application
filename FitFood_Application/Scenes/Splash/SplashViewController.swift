//
//  SplashViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit
import Nivelir

final class SplashViewController: UIViewController {

    // MARK: - Subviews

    private lazy var contentView = SplashView()

    // MARK: - Properties

    private let screens: SplashScreens
    private let screenNavigator: ScreenNavigator

    // MARK: - Initializer

    init(screens: SplashScreens, screenNavigator: ScreenNavigator) {
        self.screens = screens
        self.screenNavigator = screenNavigator

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self else { return }

            screenNavigator.navigate(to: screens.showHomeRoute())
        }
    }
}
