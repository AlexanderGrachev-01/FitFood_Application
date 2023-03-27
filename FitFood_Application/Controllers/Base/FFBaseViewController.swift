//
//  FFBaseViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import UIKit
import SnapKit

class FFBaseViewController: UIViewController {
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = Asset.Colors.secondaryBackground
        navigationController?.navigationBar.backgroundColor = Asset.Colors.secondaryBackground
    }
}
