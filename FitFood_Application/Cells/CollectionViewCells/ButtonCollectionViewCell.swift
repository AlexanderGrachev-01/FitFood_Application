//
//  ButtonCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class ButtonCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "ButtonCollectionViewCell"

    //MARK: - Handlers

    var onTapped: (() -> Void)?

    // MARK: - Subviews

    private var button = UIButton()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension ButtonCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureButton()
    }

    func configureButton() {
        button.layer.cornerRadius = 16.0
        button.backgroundColor = Asset.Colors.green
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(Asset.Colors.white, for: .normal)
        button.setTitleColor(Asset.Colors.lightGray, for: .highlighted)
        button.addAction(
            UIAction { [weak self] _ in
                self?.onTapped?()
            }, for: .touchUpInside
        )
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - Public Configure

extension ButtonCollectionViewCell {
    func configure(buttonTitle: String) {
        button.setTitle(buttonTitle, for: .normal)
    }
}
