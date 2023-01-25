//
//  FFSettingsViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFSettingsViewController: BaseViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = "Settings"
        view.backgroundColor = .systemBackground
    }
}
