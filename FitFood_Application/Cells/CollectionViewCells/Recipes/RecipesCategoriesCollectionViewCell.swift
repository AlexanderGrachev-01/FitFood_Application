//
//  RecipesCategoriesCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 19.04.2023.
//

import UIKit

final class RecipesCategoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "RecipesCategoriesCollectionViewCell"
    
    // MARK: - Subviews
    
    private lazy var backView = UIView()
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
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

private extension RecipesCategoriesCollectionViewCell {
    func configureViews() {
        configureBackView()
        configureTitleLabel()
    }
    
    func configureBackView() {
        backView.layer.cornerRadius = contentView.frame.width / 2
        backView.backgroundColor = Asset.Colors.categoryCellBackground
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(contentView.snp.width)
        }
        configureImageView()
    }
    
    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        backView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imageViewSize)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func configureTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = Asset.Colors.label
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom).offset(Constants.titleLabelTopOffset)
            $0.left.right.equalToSuperview()
        }
    }
}

// MARK: - Public

extension RecipesCategoriesCollectionViewCell {
    func configure(image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}

// MARK: - Constants

private extension RecipesCategoriesCollectionViewCell {
    enum Constants {
        static let imageViewSize = 52
        static let titleLabelTopOffset = 12
    }
}
