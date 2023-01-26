//
//  FFWelcomePageViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import UIKit

final class FFWelcomePageViewController: BaseAuthViewController {
    
    // MARK: - Constans
    
    private let warningLabelBottomOffset = 16
    
    // MARK: - Subviews
    
    private lazy var warningLabel = UILabel()
    
    // MARK: - Layout
    
    override func configureViews() {
        super.configureViews()
        
        subviewsSettings(buttonTitle: "Sign in",
                         isFirst: true,
                         textFieldPlaceholder: nil)
        configureWarningLabel()
    }
    
    private func configureWarningLabel() {
        warningLabel.text = "By signing up you agree to our\nterms of use and privacy policy"
        warningLabel.font = .systemFont(ofSize: 12)
        warningLabel.textColor = .lightGray
        warningLabel.numberOfLines = 2
        view.addSubview(warningLabel)
        
        warningLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-warningLabelBottomOffset)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    override func buttonWasTapped(_ sender: Any) {
        navigationController?.pushViewController(FFPhoneNumberViewController(), animated: true)
    }
}
