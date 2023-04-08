//
//  FFBaseAuthViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

class FFBaseAuthViewController: UIViewController {
    // MARK: - Subviews
    
    lazy var button = UIButton()
    lazy var textField = UITextField()
    
    private lazy var backButton = UIButton()
    private lazy var backgroundImageView = UIImageView()
    private lazy var logoImageView = UIImageView()
    private lazy var textFieldUnderline = UIView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        configureViews()
    }
}

// MARK: - Layout

private extension FFBaseAuthViewController {
    func configureViews() {
        configureBackgroundImage()
        configureBackButton()
        configureLogoImage()
        configureTextField()
        configureTextFieldUnderline()
        configureButton()
    }
    
    func configureBackgroundImage() {
        backgroundImageView.image = Asset.Images.authBackground
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func configureBackButton() {
        backButton.setImage(
            Asset.Images.backButton.withTintColor(Asset.Colors.white),
            for: .normal
        )
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.height.equalTo(Constans.backButtonSize)
            $0.width.equalTo(Constans.backButtonSize)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constans.backButtonTopOffset)
            $0.left.equalToSuperview().offset(Constans.backButtonleftOffset)
        }
    }
    
    func configureLogoImage() {
        logoImageView.image = Asset.Images.logo
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(Constans.ffLogoTopOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constans.ffLogoHeght)
            $0.width.equalTo(Constans.ffLogoWidth)
        }
    }
    
    func configureTextField() {
        textField.borderStyle = .none
        textField.textColor = .white
        textField.returnKeyType = .send
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 26, weight: .bold)
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-Constans.textFieldBottomOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constans.textFieldHeight)
            $0.width.equalTo(Constans.textFieldWidth)
        }
    }
    
    func configureTextFieldUnderline() {
        textFieldUnderline.backgroundColor = .white
        view.addSubview(textFieldUnderline)
        textFieldUnderline.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.centerX.equalTo(textField.snp.centerX)
            $0.width.equalTo(Constans.lineWidth)
            $0.height.equalTo(Constans.lineHeight)
        }
    }
    
    func configureButton() {
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = Constans.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(Constans.centerYButtonOffset)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constans.centerButtonWidth)
            $0.height.equalTo(Constans.buttonHeight)
        }
    }
    
    func moveForFirst() {
        logoImageView.snp.removeConstraints()
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(Constans.ffLogoHeght)
            $0.width.equalTo(Constans.ffLogoWidth)
        }
        backButton.isHidden = true
        button.snp.removeConstraints()
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-Constans.buttonBottomOffset)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(Constans.buttonHorizontalOffset)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-Constans.buttonHorizontalOffset)
            $0.height.equalTo(Constans.buttonHeight)
        }
    }
}

// MARK: - Public

extension FFBaseAuthViewController {
    func subviewsSettings(buttonTitle: String, isFirst: Bool, textFieldPlaceholder: String?) {
        button.setTitle(buttonTitle, for: .normal)
        guard isFirst else {
            textField.placeholder = textFieldPlaceholder ?? ""
            return
        }
        
        textField.isHidden = true
        textFieldUnderline.isHidden = true
        moveForFirst()
    }
    
    @objc
    func buttonWasTapped(_ sender: Any) {}
    
    @objc
    private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constans
    
private extension FFBaseAuthViewController {
    enum Constans {
        static let backButtonTopOffset = 14
        static let backButtonleftOffset = 16
        static let backButtonSize = 24
        
        static let ffLogoTopOffset = 155
        static let ffLogoHeght = 53
        static let ffLogoWidth = 234
        
        static let buttonBottomOffset = 70
        static let buttonHorizontalOffset = 16
        static let buttonHeight = 44
        static let buttonCornerRadius: CGFloat = 12

        static let textFieldBottomOffset = 40
        static let textFieldHeight = 36
        static let textFieldWidth = 280
        static let lineHeight = 1
        static let lineWidth = 290
        
        static let centerYButtonOffset = 30
        static let centerButtonWidth = 320
    }
}
