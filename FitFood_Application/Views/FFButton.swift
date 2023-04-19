//
//  FFButton.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 19.04.2023.
//

import UIKit

final class FFButton: UIButton {
    // MARK: - Properties
    
    var isPicked = false {
        didSet {
            if isPicked {
                layer.borderWidth = 0
                setTitleColor(Asset.Colors.white, for: .normal)
                backgroundColor = Asset.Colors.green
            } else {
                layer.borderWidth = 1
                setTitleColor(Asset.Colors.label, for: .normal)
                backgroundColor = .clear
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FFButton {
    func configureViews() {
        layer.borderWidth = Constants.buttonBorderWidth
        layer.borderColor = Asset.Colors.lightGreen.cgColor
        layer.cornerRadius = Constants.buttonCornerRadius
        titleLabel?.textAlignment = .center
        titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        setTitleColor(Asset.Colors.label, for: .normal)
    }
}

private extension FFButton {
    enum Constants {
        static let buttonBorderWidth = 1.0
        static let buttonCornerRadius = 16.0
    }
}
