//
//  FFSmsCodeViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

final class FFSmsCodeViewController: FFBaseAuthViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - layout
    
    override func configureViews() {
        super.configureViews()
        
        subviewsSettings(buttonTitle: "Confirm code",
                         isFirst: false,
                         textFieldPlaceholder: "Enter code")
        textField.textContentType = .oneTimeCode
        textField.delegate = self
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    // MARK: - Action
    
    override func buttonWasTapped(_ sender: Any) {
        guard let code = textField.text, !code.isEmpty else {
            return
        }
        
        DispatchQueue.main.async {
            self.button.alpha = 0.5
            self.button.isEnabled = false
        }
        
        AuthorizationManager.shared.verifyCode(code) { [weak self] success in
            guard success else { return }
            DispatchQueue.main.async {
                self?.textField.resignFirstResponder()
                UIApplication.shared.windows.first?.rootViewController = FFTabBarController()
            }
        }
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
