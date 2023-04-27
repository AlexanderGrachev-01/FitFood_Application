//
//  RecipeDetilsCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.04.2023.
//

import UIKit

final class RecipeDetilsCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "RecipeInfoCollectionViewCell"
    
    // MARK: - Subviews
    
    private lazy var imageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var kcalImageView = UIImageView()
    private lazy var kcalLabel = UILabel()
    private lazy var personsImageView = UIImageView()
    private lazy var personsLabel = UILabel()
    private lazy var foodContentsView = FoodContentsView()
    
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

private extension RecipeDetilsCollectionViewCell {
    func configureViews() {
        configureImageView()
        configureNameLabel()
        configureKcalImageView()
        configureKcalLabel()
        configurePersonsImageView()
        configurePersonsLabel()
        configureFoodContentsView()
    }
    
    func configureImageView() {
        imageView.image = Asset.Images.dishPhoto
        imageView.layer.cornerRadius = Constants.imageViewRafius
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.height.equalTo(Constants.imageViewHeight)
            $0.top.left.right.equalToSuperview()
        }
    }
    
    func configureNameLabel() {
        nameLabel.text = "Fruit salad"
        nameLabel.font = .systemFont(ofSize: 24, weight: .medium)
        nameLabel.textColor = Asset.Colors.white
        nameLabel.backgroundColor = .black.withAlphaComponent(Constants.backgroundAlpha)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(Constants.nameLabelMaxwidth)
            $0.left.equalToSuperview().offset(Constants.nameLabelLeftOffset)
            $0.bottom.equalTo(imageView).offset(-Constants.nameLabelBottomOffset)
        }
    }
    
    func configureKcalImageView() {
        kcalImageView.image = Asset.Images.blackFire.withTintColor(Asset.Colors.white)
        kcalImageView.contentMode = .scaleAspectFit
        kcalImageView.backgroundColor = .black.withAlphaComponent(Constants.backgroundAlpha)
        contentView.addSubview(kcalImageView)
        kcalImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.bottom.equalTo(nameLabel.snp.centerY).offset(-Constants.kcalImageViewBottomOffset)
            $0.right.equalToSuperview().offset(-Constants.kcalImageViewRightOffset)
        }
    }
    
    func configurePersonsImageView() {
        personsImageView.image = Asset.Images.personBlack.withTintColor(Asset.Colors.white)
        personsImageView.contentMode = .scaleAspectFit
        personsImageView.backgroundColor = .black.withAlphaComponent(Constants.backgroundAlpha)
        contentView.addSubview(personsImageView)
        personsImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(kcalImageView.snp.bottom).offset(Constants.personsImageViewTopOffset)
            $0.left.equalTo(kcalImageView)
        }
    }
    
    func configurePersonsLabel() {
        personsLabel.text = "1-2 persons"
        personsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        personsLabel.textColor = Asset.Colors.white
        personsLabel.backgroundColor = .black.withAlphaComponent(Constants.backgroundAlpha)
        contentView.addSubview(personsLabel)
        personsLabel.snp.makeConstraints {
            $0.centerY.equalTo(personsImageView)
            $0.left.equalTo(personsImageView.snp.right).offset(Constants.labelsLeftOffset)
        }
    }
    
    func configureKcalLabel() {
        kcalLabel.text = "240 kcal"
        kcalLabel.font = .systemFont(ofSize: 14, weight: .regular)
        kcalLabel.textColor = Asset.Colors.white
        kcalLabel.backgroundColor = .black.withAlphaComponent(Constants.backgroundAlpha)
        contentView.addSubview(kcalLabel)
        kcalLabel.snp.makeConstraints {
            $0.centerY.equalTo(kcalImageView)
            $0.left.equalTo(kcalImageView.snp.right).offset(Constants.labelsLeftOffset)
        }
    }
    
    func configureFoodContentsView() {
        contentView.addSubview(foodContentsView)
        foodContentsView.snp.makeConstraints {
            $0.height.equalTo(Constants.foodContentsViewHeight)
            $0.top.equalTo(imageView.snp.bottom).offset(Constants.foodContentsViewTopOffset)
            $0.left.right.equalToSuperview()
        }
    }
}

// MARK: - Constants

private extension RecipeDetilsCollectionViewCell {
    enum Constants {
        static let imageViewHeight = 275
        static let imageViewRafius = 16.0
        
        static let nameLabelLeftOffset = 16
        static let nameLabelBottomOffset = 32
        static let nameLabelMaxwidth = 220
        
        static let foodContentsViewHeight = 192
        static let foodContentsViewTopOffset = 16
        
        static let labelsLeftOffset = 10
        static let labelsCornerRadius = 5.0
        static let imagesSize = 16
        static let kcalImageViewBottomOffset = 4
        static let kcalImageViewRightOffset = 105
        static let personsImageViewTopOffset = 8
        static let backgroundAlpha = 0.01
    }
}

