//
//  FFFastingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFFastingViewController: FFBaseViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = Asset.Strings.fasting
        navigationController?.navigationBar.addBottomBorder(
            with: Asset.Colors.separator,
            height: 0.5
        )
    }
}
