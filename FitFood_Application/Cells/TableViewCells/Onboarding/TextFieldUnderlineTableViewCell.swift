//
//  TextFieldUnderlineTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class TextFieldUnderlineTableViewCell: UITableViewCell {
    // MARK: - Handlers

    var onTextDidChange: ((_ text: String) -> Void)?
    
    // MARK: - Identifier

    static let identifier = "TextFieldUnderlineTableViewCell"

    // MARK: - Subviews

    private var textField = UITextField()
    private var measureLabel = UILabel()
    private var underlineView = UIView()

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

private extension TextFieldUnderlineTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureTextField()
        configureMeasureLabel()
        configureUnderlineView()
    }

    func configureTextField() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.textColor = Asset.Colors.label
        contentView.addSubview(textField)
        textField.snp.makeConstraints {
            $0.height.equalTo(Constants.TextField.height)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }

    func configureMeasureLabel() {
        measureLabel.font = .systemFont(ofSize: 16, weight: .regular)
        measureLabel.textColor = Asset.Colors.green
        contentView.addSubview(measureLabel)
        measureLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-10)
        }
    }
    
    func configureUnderlineView() {
        underlineView.backgroundColor = Asset.Colors.green
        contentView.addSubview(underlineView)
        underlineView.snp.makeConstraints {
            $0.height.equalTo(Constants.Underline.height)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension TextFieldUnderlineTableViewCell {
    func configure(measure: String, keyboardType: UIKeyboardType) {
        measureLabel.text = measure
        textField.keyboardType = keyboardType
    }
}

// MARK: - TextFieldDidChange

extension TextFieldUnderlineTableViewCell {
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        onTextDidChange?(text)
    }
}

// MARK: - Constants

private extension TextFieldUnderlineTableViewCell {
    enum Constants {
        enum TextField {
            static let height = 44
        }
        enum Underline {
            static let height = 1
        }
    }
}
