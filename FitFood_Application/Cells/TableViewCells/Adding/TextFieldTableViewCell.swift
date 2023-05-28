//
//  TextFieldTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.05.2023.
//

import UIKit

final class TextFieldTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "TextFieldTableViewCell"

    // MARK: - Subviews

    private var textField = UITextField()
    private var errorLabel = UILabel()

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

private extension TextFieldTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureTextField()
        configureErrorLabel()
    }

    func configureTextField() {
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.textColor = Asset.Colors.label
        textField.layer.borderWidth = Constants.TextField.borderWidth
        textField.layer.cornerRadius = Constants.TextField.cornerRadius
        textField.layer.borderColor = Asset.Colors.green.cgColor
        contentView.addSubview(textField)
        textField.snp.makeConstraints {
            $0.height.equalTo(Constants.TextField.height)
            $0.top.left.right.equalToSuperview()
        }
    }

    func configureErrorLabel() {
        errorLabel.text = Asset.Strings.fillTheField
        errorLabel.font = .systemFont(ofSize: 14, weight: .regular)
        errorLabel.textColor = Asset.Colors.errorRed
        errorLabel.textAlignment = .right
        contentView.addSubview(errorLabel)
        errorLabel.snp.makeConstraints {
            $0.centerY.equalTo(textField)
            $0.right.equalTo(textField).offset(-Constants.ErrorLabel.right)
        }
    }
}

// MARK: - Public configure

extension TextFieldTableViewCell {
    func configure(placeholderText: String) {
        textField.placeholder = placeholderText
    }
}

// MARK: - Constants

private extension TextFieldTableViewCell {
    enum Constants {
        enum TextField {
            static let height = 44
            static let borderWidth = 1.0
            static let cornerRadius = 16.0
        }
        enum ErrorLabel {
            static let right = 16
        }
    }
}
