//
//  FFPhoneNumberViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

final class FFPhoneNumberViewController: FFBaseAuthViewController {
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    override func buttonWasTapped(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty  else {
            return
        }
        
        DispatchQueue.main.async {
            self.button.alpha = 0.5
            self.button.isEnabled = false
        }
        
        var number = text
        number.removeFirst()
        AuthorizationManager.shared.verifyPhone("+78\(number)") { [weak self] success in
            guard success else { return }
            DispatchQueue.main.async {
                self?.textField.resignFirstResponder()
                let vc = FFSmsCodeViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
    
// MARK: - layout

private extension FFPhoneNumberViewController {
    func configureSubviews() {
        subviewsSettings(
            buttonTitle: "Send code",
            isFirst: false,
            textFieldPlaceholder: "Enter phone number"
        )
        textField.textContentType = .telephoneNumber
        textField.delegate = self
        button.isEnabled = false
        button.alpha = 0.5
    }
}

// MARK: - UITextFieldDelegate

extension FFPhoneNumberViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let count = textField.text?.count,
              count == 11 else {
            button.alpha = 0.5
            button.isEnabled = false
            return
        }
        
        button.alpha = 1
        button.isEnabled = true
    }
}
