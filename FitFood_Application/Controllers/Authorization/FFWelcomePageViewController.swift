//
//  FFWelcomePageViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import UIKit

final class FFWelcomePageViewController: BaseViewController {
    
    // MARK: - Constans
    
    private let logoTopOffset = 40
    private let logoHeight = 200
    private let logoWidth = 280
    
    private let signInButtonBottomOffset = 130
    private let signInButtonHeight = 42
    private let signInButtonWidth = 280
    private let signInButtonCornerRadius: CGFloat = 8
    
    private let warningLabelBottomOffset = 16
    
    // MARK: - Subviews
    
    private lazy var backgroundImageView = UIImageView()
    private lazy var logoImageView = UIImageView()
    private lazy var signInButton = UIButton()
    private lazy var warningLabel = UILabel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        configureBackgroundImage()
        configureLogoImage()
        configureSignInButton()
        configureWarningLabel()
    }
    
    private func configureBackgroundImage() {
        backgroundImageView.image = UIImage(named: "FFWelcomeBackground")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)

        backgroundImageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func configureLogoImage() {
        logoImageView.image = UIImage(named: "FFLogoImage")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(logoTopOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(logoHeight)
            $0.width.equalTo(logoWidth)
        }
    }
    
    private func configureSignInButton() {
        signInButton.setTitle("Log in with a phone number", for: .normal)
        signInButton.setTitleColor(.label, for: .normal)
        signInButton.backgroundColor = .systemGray
        signInButton.layer.cornerRadius = signInButtonCornerRadius
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-signInButtonBottomOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(signInButtonHeight)
            $0.width.equalTo(signInButtonWidth)
        }
    }
    
    private func configureWarningLabel() {
        warningLabel.text = "By signing up you agree to our\nterms of use and privacy policy"
        warningLabel.font = .systemFont(ofSize: 12)
        warningLabel.numberOfLines = 2
        view.addSubview(warningLabel)
        
        warningLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-warningLabelBottomOffset)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - Private functions
    
    @objc
    private func signInTapped() {
        let vc = FFPhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
