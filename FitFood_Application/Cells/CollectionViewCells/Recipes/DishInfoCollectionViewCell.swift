//
//  DishInfoCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 17.04.2023.
//

import UIKit

final class DishInfoCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "DishInfoCollectionViewCell"
    
    // MARK: - Subviews
    
    private lazy var photoImageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var kcalImageView = UIImageView()
    private lazy var kcalLabel = UILabel()
    private lazy var personsImageView = UIImageView()
    private lazy var personsLabel = UILabel()
    
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

private extension DishInfoCollectionViewCell {
    func configureViews() {
        configurePhotoImageView()
        configureNameLabel()
        configureKcalImageView()
        configureKcalLabel()
        configurePersonsImageView()
        configurePersonsLabel()
    }
    
    func configurePhotoImageView() {
        photoImageView.image = Asset.Images.dishPhoto
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.layer.cornerRadius = Constants.photoImageViewRadius
        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.photoImageViewHeight)
            $0.top.left.right.equalToSuperview()
        }
    }
    
    func configureNameLabel() {
        nameLabel.text = "Fruit salad"
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.textColor = Asset.Colors.label
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(Constants.nameLabelTopOffset)
            $0.left.equalToSuperview()
        }
    }
    
    func configureKcalImageView() {
        kcalImageView.image = Asset.Images.blackFire
        kcalImageView.contentMode = .scaleAspectFit
        contentView.addSubview(kcalImageView)
        kcalImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.kcalImageViewTopOffset)
            $0.left.equalToSuperview()
        }
    }
    
    func configureKcalLabel() {
        kcalLabel.text = "240 kcal"
        kcalLabel.font = .systemFont(ofSize: 14, weight: .regular)
        kcalLabel.textColor = Asset.Colors.label
        contentView.addSubview(kcalLabel)
        kcalLabel.snp.makeConstraints {
            $0.centerY.equalTo(kcalImageView)
            $0.left.equalTo(kcalImageView.snp.right).offset(Constants.labelLeftOffset)
        }
    }
    
    func configurePersonsImageView() {
        personsImageView.image = Asset.Images.personBlack.withTintColor(Asset.Colors.darkBlue)
        personsImageView.contentMode = .scaleAspectFit
        contentView.addSubview(personsImageView)
        personsImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(kcalImageView.snp.bottom).offset(Constants.personsImageViewTopOffset)
            $0.left.equalToSuperview()
        }
    }
    
    func configurePersonsLabel() {
        personsLabel.text = "1-2 persons"
        personsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        personsLabel.textColor = Asset.Colors.label
        contentView.addSubview(personsLabel)
        personsLabel.snp.makeConstraints {
            $0.centerY.equalTo(personsImageView)
            $0.left.equalTo(personsImageView.snp.right).offset(Constants.labelLeftOffset)
        }
    }
}

// MARK: - Constants

private extension DishInfoCollectionViewCell {
    enum Constants {
        static let photoImageViewRadius = 16.0
        static let photoImageViewHeight = 134
        
        static let nameLabelTopOffset = 12
        
        static let labelLeftOffset = 10
        
        static let imagesSize = 16
        static let kcalImageViewTopOffset = 12.5
        static let personsImageViewTopOffset = 8
    }
}
