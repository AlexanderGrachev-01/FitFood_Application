//
//  HomeTabBarController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit

final class HomeTabBarController: UITabBarController {

    // MARK: - Initializer

    init() {
        super.init(nibName: nil, bundle: nil)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func configureUI() {}
}
