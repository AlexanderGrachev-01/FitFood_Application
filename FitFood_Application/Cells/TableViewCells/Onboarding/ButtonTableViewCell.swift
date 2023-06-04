//
//  ButtonTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class ButtonTableViewCell: UITableViewCell {
    // MARK: - Handlers

    var onPicked: (() -> Void)?
    
    // MARK: - Identifier

    static let identifier = "ButtonTableViewCell"

    // MARK: - Subviews

    private var button = FFButton()

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

private extension ButtonTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureButton()
    }

    func configureButton() {
        button.setTitleColor(Asset.Colors.white, for: .normal)
        button.isPicked = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.top.equalTo(Constants.Button.top)
            $0.bottom.equalTo(Constants.Button.bottom)
            $0.left.right.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension ButtonTableViewCell {
    func configure(title: String) {
        button.setTitle(title, for: .normal)
    }
}

// MARK: - Actions

extension ButtonTableViewCell {
    @objc
    private func buttonAction() {
        onPicked?()
    }
}

// MARK: - Constants

private extension ButtonTableViewCell {
    enum Constants {
        enum Button {
            static let top = 10
            static let bottom = -10
            static let height = 51
        }
    }
}
