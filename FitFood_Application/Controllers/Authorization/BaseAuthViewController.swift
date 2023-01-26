//
//  BaseAuthViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

class BaseAuthViewController: BaseViewController {
    
    // MARK: - Constans
    
    private let ffLogoTopOffset = 130
    private let ffLogoHeght = 42
    private let ffLogoWidth = 140
    
    private let buttonBottomOffset = 70
    private let buttonHorizontalOffset = 16
    private let buttonHeight = 44
    private let buttonCornerRadius: CGFloat = 12
    
    private let textFieldBottomOffset = 40
    private let textFieldHeight = 36
    private let textFieldWidth = 280
    private let lineHeight = 1
    private let lineWidth = 290
    
    private let centerYButtonOffset = 30
    private let centerButtonWidth = 320
    
    // MARK: - Subviews
    
    private lazy var backgroundImageView = UIImageView()
    private lazy var logoImageView = UIImageView()
    private lazy var button = UIButton()
    private lazy var textField = UITextField()
    private lazy var textFieldUnderline = UIView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    func configureViews() {
        configureBackgroundImage()
        configureLogoImage()
        configureTextField()
        configureTextFieldUnderline()
        configureButton()
    }
    
    private func configureBackgroundImage() {
        backgroundImageView.image = UIImage(named: "FFAuthBackground")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)

        backgroundImageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func configureLogoImage() {
        logoImageView.image = UIImage(named: "FFLogo")
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)

        logoImageView.snp.makeConstraints {
            $0.top.equalTo(ffLogoTopOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(ffLogoHeght)
            $0.width.equalTo(ffLogoWidth)
        }
    }
    
    private func configureTextField() {
        textField.borderStyle = .none
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 26, weight: .bold)
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-textFieldBottomOffset)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(textFieldHeight)
            $0.width.equalTo(textFieldWidth)
        }
    }
    
    private func configureTextFieldUnderline() {
        textFieldUnderline.backgroundColor = .white
        view.addSubview(textFieldUnderline)
        
        textFieldUnderline.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.centerX.equalTo(textField.snp.centerX)
            $0.width.equalTo(lineWidth)
            $0.height.equalTo(lineHeight)
        }
    }
    
    private func configureButton() {
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(centerYButtonOffset)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(centerButtonWidth)
            $0.height.equalTo(buttonHeight)
        }
    }
    
    private func moveForFirst() {
        logoImageView.snp.removeConstraints()
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(ffLogoHeght)
            $0.width.equalTo(ffLogoWidth)
        }
        button.snp.removeConstraints()
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-buttonBottomOffset)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(buttonHorizontalOffset)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-buttonHorizontalOffset)
            $0.height.equalTo(buttonHeight)
        }
    }
    
    // MARK: - Public
    
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
}
