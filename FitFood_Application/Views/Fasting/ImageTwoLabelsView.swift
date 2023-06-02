//
//  FastingImageStatView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class ImageTwoLabelsView: UIView {
    // MARK: - Subviews

    private var imageView = UIImageView()
    private var infoLabel = UILabel()
    private var nameLabel = UILabel()

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

private extension ImageTwoLabelsView {
    func configureViews() {
        backgroundColor = .clear
        configureImageView()
        configureInfoLabel()
        configureNameLabel()
    }

    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.ImageView.size)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.ImageView.top)
        }
    }

    func configureInfoLabel() {
        infoLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        infoLabel.textColor = Asset.Colors.label
        infoLabel.textAlignment = .center
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(Constants.InfoLabel.top)
        }
    }

    func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        nameLabel.textColor = Asset.Colors.label.withAlphaComponent(0.6)
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(infoLabel.snp.bottom)
        }
    }
}

// MARK: - Public configure

extension ImageTwoLabelsView {
    func configure(image: UIImage, info: String, name: String) {
        imageView.image = image
        infoLabel.text = info
        nameLabel.text = name
    }
}

// MARK: - Constants

private extension ImageTwoLabelsView {
    enum Constants {
        enum ImageView {
            static let size = 40
            static let top = 17
        }
        enum InfoLabel {
            static let top = 6
        }
    }
}
