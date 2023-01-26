//
//  FFPhoneNumberViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

final class FFPhoneNumberViewController: BaseAuthViewController {
    
    // MARK: - layout
    
    override func configureViews() {
        super.configureViews()
        
        subviewsSettings(buttonTitle: "Send code",
                         isFirst: false,
                         textFieldPlaceholder: "Enter phone number")
    }
    
    override func buttonWasTapped(_ sender: Any) {
        navigationController?.pushViewController(FFSmsCodeViewController(), animated: true)
    }
}
