//
//  FFWelcomePageViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import UIKit

final class FFWelcomePageViewController: FFBaseAuthViewController {
    // MARK: - Subviews
    
    private var warningLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    // MARK: - Action
    
    override func buttonWasTapped(_ sender: Any) {
        navigationController?.pushViewController(
            FFPhoneNumberViewController(),
            animated: true
        )
    }
}
    
// MARK: - Layout
    
private extension FFWelcomePageViewController {
    func configureSubviews() {
        subviewsSettings(
            buttonTitle: "Sign in",
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
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-Constans.warningLabelBottomOffset)
            $0.centerX.equalToSuperview()
        }
    }
}

private extension FFWelcomePageViewController {
    enum Constans {
        static let warningLabelBottomOffset = 16
    }
}
