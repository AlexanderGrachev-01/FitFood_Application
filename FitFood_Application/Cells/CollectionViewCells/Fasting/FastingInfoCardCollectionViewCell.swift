//
//  FastingInfoCardCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 01.06.2023.
//

import UIKit

final class FastingInfoCardCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingInfoCardCollectionViewCell"

    // MARK: - Subviews

    private var imageView = UIImageView()
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

        imageView.image = UIImage()
        label.text = ""
    }
}

// MARK: - Layout

private extension FastingInfoCardCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.cornerRadius
        configureImageView()
        configureLabel()
    }

    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.ImageView.size)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.ImageView.top)
        }
    }

    func configureLabel() {
        label.textAlignment = .center
        label.textColor = Asset.Colors.label
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(Constants.Label.top)
        }
    }
}

// MARK: - Public configure

extension FastingInfoCardCollectionViewCell {
    func configure(image: UIImage, text: String) {
        imageView.image = image
        label.text = text
    }
}

// MARK: - Constants

private extension FastingInfoCardCollectionViewCell {
    enum Constants {
        enum ImageView {
            static let size = 40
            static let top = 52
        }
        enum Label {
            static let top = 26
        }
        static let cornerRadius = 20.0
    }
}
