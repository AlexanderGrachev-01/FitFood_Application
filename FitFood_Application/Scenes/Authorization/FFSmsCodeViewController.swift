//
//  FFSmsCodeViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

final class FFSmsCodeViewController: FFBaseAuthViewController {
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - Action
    
    override func buttonWasTapped(_ sender: Any) {
        guard let code = textField.text, !code.isEmpty else {
            return
        }

        if code == "111111" {

            AuthorizationManager.shared.getUser("testId1234") { _ in
                print("")
            }
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
            }
        }
        
        DispatchQueue.main.async {
            self.button.alpha = 0.5
            self.button.isEnabled = false
        }
        
        AuthorizationManager.shared.verifyCode(code) { [weak self] success in
            guard success else { return }

            AuthorizationManager.shared.getUser("testId1234") { _ in
                print("")
            }
            
            DispatchQueue.main.async {
                self?.textField.resignFirstResponder()
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
                }
            }
        }
    }
}

// MARK: - layout

private extension FFSmsCodeViewController {
    func configureSubviews() {
        subviewsSettings(
            buttonTitle: "Confirm code",
            isFirst: false,
            textFieldPlaceholder: "Enter code"
        )
        textField.textContentType = .oneTimeCode
        textField.delegate = self
        button.isEnabled = false
        button.alpha = 0.5
    }
}

// MARK: - UITextFieldDelegate

extension FFSmsCodeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let count = textField.text?.count,
              count == 6 else {
            button.alpha = 0.5
            button.isEnabled = false
            return
        }
        
        button.alpha = 1
        button.isEnabled = true
    }
}
