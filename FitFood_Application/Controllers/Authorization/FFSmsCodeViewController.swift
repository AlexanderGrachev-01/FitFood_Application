//
//  FFSmsCodeViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 26.01.2023.
//

import UIKit

final class FFSmsCodeViewController: BaseAuthViewController {
    
    // MARK: - layout
    
    override func configureViews() {
        super.configureViews()
        
        subviewsSettings(buttonTitle: "Send code",
                         isFirst: false,
                         textFieldPlaceholder: "Enter code")
    }
    
    override func buttonWasTapped(_ sender: Any) {
        UIApplication.shared.windows.first?.rootViewController = FFTabBarController()
    }
}
