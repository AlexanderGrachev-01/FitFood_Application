//
//  FFRecipesViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit
import SnapKit

final class FFRecipesViewController: UIViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = "Recipes"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.addBottomBorder(with: .lightGray,
                                                            height: 0.5)
    }
}
