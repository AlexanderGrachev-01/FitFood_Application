//
//  FFDailyStatCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.03.2023.
//

import UIKit

final class FFDailyStatCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "DailyStatCollectionViewCell"
    
    // MARK: - Subviews
    
    private lazy var eatenLabel = UILabel()
    private lazy var eatenCountLabel = UILabel()
    private lazy var mealsStatView = MealsStatView()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension FFDailyStatCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        configureEatenLabel()
        configureEatenCountLabel()
        configureMealsStatView()
    }
    
    func configureEatenLabel() {
        eatenLabel.text = Asset.Strings.eaten + ":"
        eatenLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        eatenLabel.textColor = Asset.Colors.label
        contentView.addSubview(eatenLabel)
        eatenLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.eatenLabelTopOffset)
            $0.left.equalTo(contentView.snp.right).offset(-Constants.eatenLabelRightOffset)
        }
    }
    
    func configureEatenCountLabel() {
        eatenCountLabel.text = "1534 kcal"
        eatenCountLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        eatenCountLabel.textColor = Asset.Colors.label
        contentView.addSubview(eatenCountLabel)
        eatenCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(eatenLabel.snp.centerY)
            $0.right.equalToSuperview().offset(-Constants.eatenCountLabelRightOffset)
        }
    }
    
    func configureMealsStatView() {
        contentView.addSubview(mealsStatView)
        mealsStatView.snp.makeConstraints {
            $0.height.equalTo(Constants.mealsStatViewHeight)
            $0.width.equalTo(Constants.mealsStatViewWidth)
            $0.top.equalTo(eatenLabel.snp.bottom).offset(Constants.mealsStatViewTopOffset)
            $0.right.equalToSuperview().offset(-Constants.mealsStatViewRightOffset)
        }
    }
}

// MARK: - Constants

private extension FFDailyStatCollectionViewCell {
    enum Constants {
        static let contentViewCornerRadius = 20.0
        
        static let eatenLabelTopOffset = 42
        static let eatenLabelRightOffset = 189
        static let eatenCountLabelRightOffset = 19
        
        static let mealsStatViewHeight = 89
        static let mealsStatViewWidth = 170
        static let mealsStatViewTopOffset = 8
        static let mealsStatViewRightOffset = 19
    }
}
