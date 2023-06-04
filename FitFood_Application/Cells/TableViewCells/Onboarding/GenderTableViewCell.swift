//
//  GenderTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class GenderTableViewCell: UITableViewCell {
    // MARK: - Handlers

    var onGenderPicked: ((_ gender: FFGender) -> Void)?
    
    // MARK: - Identifier

    static let identifier = "GenderTableViewCell"

    // MARK: - Subviews

    private var femaleButton = FFButton()
    private var maleButton = FFButton()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension GenderTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureFemaleButton()
        configureMaleButton()
    }

    func configureFemaleButton() {
        femaleButton.setTitle(Asset.Strings.female, for: .normal)
        femaleButton.setTitleColor(Asset.Colors.white, for: .normal)
        femaleButton.isPicked = true
        femaleButton.addTarget(self, action: #selector(femaleButtonAction), for: .touchUpInside)
        contentView.addSubview(femaleButton)
        femaleButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.top.equalTo(Constants.Button.top)
            $0.bottom.equalTo(-5)
            $0.left.equalToSuperview()
            $0.right.equalTo(-(Constants.Screen.width/2) - 8)
        }
    }

    func configureMaleButton() {
        maleButton.setTitle(Asset.Strings.male, for: .normal)
        maleButton.setTitleColor(Asset.Colors.white, for: .normal)
        maleButton.isPicked = true
        maleButton.addTarget(self, action: #selector(maleButtonAction), for: .touchUpInside)
        contentView.addSubview(maleButton)
        maleButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.top.equalTo(Constants.Button.top)
            $0.bottom.equalTo(-5)
            $0.left.equalTo(Constants.Screen.width/2 + 8)
            $0.right.equalToSuperview()
        }
    }
        
}

// MARK: - Actions

extension GenderTableViewCell {
    @objc
    private func femaleButtonAction() {
        onGenderPicked?(.female)
    }
    
    @objc
    private func maleButtonAction() {
        onGenderPicked?(.male)
    }
}

// MARK: - Constants

private extension GenderTableViewCell {
    enum Constants {
        enum Button {
            static let top = 30
            static let height = 100
        }
        enum Screen {
            static let width = UIScreen.main.bounds.width - 40
        }
    }
}
