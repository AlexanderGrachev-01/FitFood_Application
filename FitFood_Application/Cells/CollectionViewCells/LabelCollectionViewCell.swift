//
//  LabelCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "LabelCollectionViewCell"

    // MARK: - Subviews

    private var label = UILabel()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        label.text = ""
    }
}

// MARK: - Layout

private extension LabelCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureLabel()
    }

    func configureLabel() {
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = Asset.Colors.label
        label.textAlignment = .center
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension LabelCollectionViewCell {
    func configure(text: String) {
        label.text = text
    }
}

