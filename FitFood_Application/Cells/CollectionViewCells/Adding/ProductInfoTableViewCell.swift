//
//  ProductInfoTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 19.04.2023.
//

import UIKit

final class ProductInfoTableViewCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "ProductInfoTableViewCell"
    
    // MARK: - Properties
    
    private var isFavourite = false {
        didSet {
            if isFavourite {
                favouritesButton.setImage(
                    Asset.Images.starFill.withTintColor(Asset.Colors.green),
                    for: .normal
                )
            } else {
                favouritesButton.setImage(
                    Asset.Images.star.withTintColor(Asset.Colors.green),
                    for: .normal
                )
            }
        }
    }
    
    // MARK: - Handlers
    
    var onChangeFavourite: ((_ isFavourite: Bool) -> Void)?
    
    // MARK: - Subviews
    
    private lazy var favouritesButton = UIButton()
    private lazy var kcalLabel = UILabel()
    private lazy var nameLabel = UILabel()
    private lazy var proteinImageView = UIImageView()
    private lazy var proteinLabel = UILabel()
    private lazy var fatImageView = UIImageView()
    private lazy var fatLabel = UILabel()
    private lazy var carbsImageView = UIImageView()
    private lazy var carbsLabel = UILabel()
    
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

private extension ProductInfoTableViewCell {
    func configureViews() {
        backgroundColor = .clear
        configureFavouritesButton()
        configureKcalLabel()
        configureNameLabel()
        configureProteinImageView()
        configureProteinLabel()
        configureFatImageView()
        configureFatLabel()
        configureCarbsImageView()
        configureCarbsLabel()
    }
    
    func configureFavouritesButton() {
        favouritesButton.setImage(
            Asset.Images.star.withTintColor(Asset.Colors.green),
            for: .normal
        )
        favouritesButton.setImage(
            Asset.Images.starFill.withTintColor(Asset.Colors.green),
            for: .highlighted
        )
        favouritesButton.contentMode = .scaleAspectFit
        favouritesButton.addTarget(self, action: #selector(favouritesAction), for: .touchDown)
        contentView.addSubview(favouritesButton)
        favouritesButton.snp.makeConstraints {
            $0.width.height.equalTo(Constants.favouritesButtonSize)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-Constants.cellSafeOffset)
        }
    }
    
    func configureKcalLabel() {
        kcalLabel.text = "47 kcal"
        kcalLabel.textColor = Asset.Colors.lightGray
        kcalLabel.font = .systemFont(ofSize: 17, weight: .regular)
        kcalLabel.textAlignment = .right
        contentView.addSubview(kcalLabel)
        kcalLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(favouritesButton.snp.left).offset(-Constants.kcalLabelRightOffset)
        }
    }
    
    func configureNameLabel() {
        nameLabel.text = "Салат “Оливье“"
        nameLabel.textColor = Asset.Colors.label
        nameLabel.font = .systemFont(ofSize: 17, weight: .medium)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.nameLabelTopOffset)
            $0.left.equalToSuperview().offset(Constants.cellSafeOffset)
        }
    }
    
    func configureProteinImageView() {
        proteinImageView.image = Asset.Images.protein
        proteinImageView.contentMode = .scaleAspectFit
        contentView.addSubview(proteinImageView)
        proteinImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.imagesTopOffset)
            $0.left.equalToSuperview().offset(Constants.cellSafeOffset)
        }
    }
    
    func configureProteinLabel() {
        proteinLabel.text = "30"
        proteinLabel.font = .systemFont(ofSize: 14, weight: .regular)
        proteinLabel.textColor = Asset.Colors.lightGray
        contentView.addSubview(proteinLabel)
        proteinLabel.snp.makeConstraints {
            $0.centerY.equalTo(proteinImageView)
            $0.left.equalTo(proteinImageView.snp.right).offset(Constants.labelOffset)
        }
    }
    
    func configureFatImageView() {
        fatImageView.image = Asset.Images.fat
        fatImageView.contentMode = .scaleAspectFit
        contentView.addSubview(fatImageView)
        fatImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.imagesTopOffset)
            $0.left.equalTo(proteinImageView.snp.right).offset(Constants.imagesLeftOffseet)
        }
    }
    
    func configureFatLabel() {
        fatLabel.text = "30"
        fatLabel.font = .systemFont(ofSize: 14, weight: .regular)
        fatLabel.textColor = Asset.Colors.lightGray
        contentView.addSubview(fatLabel)
        fatLabel.snp.makeConstraints {
            $0.centerY.equalTo(fatImageView)
            $0.left.equalTo(fatImageView.snp.right).offset(Constants.labelOffset)
        }
    }
    
    func configureCarbsImageView() {
        carbsImageView.image = Asset.Images.carbs
        carbsImageView.contentMode = .scaleAspectFit
        contentView.addSubview(carbsImageView)
        carbsImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.imagesSize)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.imagesTopOffset)
            $0.left.equalTo(fatImageView.snp.right).offset(Constants.imagesLeftOffseet)
        }
    }
    
    func configureCarbsLabel() {
        carbsLabel.text = "30"
        carbsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        carbsLabel.textColor = Asset.Colors.lightGray
        contentView.addSubview(carbsLabel)
        carbsLabel.snp.makeConstraints {
            $0.centerY.equalTo(carbsImageView)
            $0.left.equalTo(carbsImageView.snp.right).offset(Constants.labelOffset)
        }
    }
}

// MARK: - Public

extension ProductInfoTableViewCell {
    func configure(product: FFProduct) {
        nameLabel.text = product.name
        kcalLabel.text = "\(product.calories)"
        carbsLabel.text = "\(product.carbs)"
        fatLabel.text = "\(product.fat)"
        proteinLabel.text = "\(product.protein)"
    }
}

// MARK: - Actions

extension ProductInfoTableViewCell {
    @objc
    private func favouritesAction() {
        isFavourite = !isFavourite
        onChangeFavourite?(isFavourite)
    }
}

// MARK: - Constants

private extension ProductInfoTableViewCell {
    enum Constants {
        static let cellSafeOffset = 20
        static let imagesSize = 24
        
        static let imagesTopOffset = 8
        static let imagesLeftOffseet = 34
        static let labelOffset = 4
        
        static let favouritesButtonSize = 24
        static let kcalLabelRightOffset = 12
        static let nameLabelTopOffset = 12
    }
}
