//
//  FastingConfigCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 31.05.2023.
//

import UIKit

final class FastingConfigCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingConfigCollectionViewCell"

    // MARK: - Subviews

    private var imageView = UIImageView()
    private var chevron = UIImageView()
    private var label = UILabel()

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

private extension FastingConfigCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.cornerRadius
        configureImageView()
        configureChevron()
        configureLabel()
    }

    func configureImageView() {
        imageView.image = Asset.Images.fastingConfig
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.equalTo(Constants.ImageView.height)
            $0.width.equalTo(Constants.ImageView.width)
            $0.top.equalToSuperview().offset(Constants.ImageView.top)
            $0.left.equalToSuperview().offset(Constants.ImageView.left)
        }
    }

    func configureChevron() {
        chevron.image = Asset.Images.rightGreenChevron
        chevron.contentMode = .scaleAspectFit
        contentView.addSubview(chevron)
        chevron.snp.makeConstraints {
            $0.height.equalTo(Constants.Chevron.height)
            $0.width.equalTo(Constants.Chevron.width)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-Constants.Chevron.right)
        }
    }

    func configureLabel() {
        label.text = Asset.Strings.chooseIntervalPlan
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 3
        label.textColor = Asset.Colors.green
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.width.equalTo(Constants.Label.width)
            $0.centerY.equalToSuperview()
            $0.right.equalTo(chevron.snp.left).offset(-Constants.Label.right)
        }
    }
}

// MARK: - Constants

private extension FastingConfigCollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height = 148
            static let width = 158
            static let top = 20
            static let left = 36
        }
        enum Chevron {
            static let height = 24
            static let width = 16
            static let right = 20
        }
        enum Label {
            static let width = 110
            static let right = 8
        }
        static let cornerRadius = 20.0
    }
}
