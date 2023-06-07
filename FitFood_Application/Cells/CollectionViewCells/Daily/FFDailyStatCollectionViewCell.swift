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

    // MARK: - Properties

    private var totalKcal = 0
    private var eatenKcal = 0
    private var breakfastKcal = 0
    private var lunchKcal = 0
    private var dinerKcal = 0
    private var snacksKcal = 0
    
    // MARK: - Subviews
    
    private var arcProgressBarView = ArcProgressBarView()
    private var kcalImageView = UIImageView()
    private var remainedLabel = UILabel()
    private var remainedCountLabel = UILabel()
    private var eatenLabel = UILabel()
    private var eatenCountLabel = UILabel()
    private var mealsStatView = MealsStatView()
    private var foodContentsView = FoodContentsView()
    
    
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
        configureArcProgressBarView()
        configureRemainedCountLabel()
        configureRemainedLabel()
        configureKcalImageView()
        configureEatenLabel()
        configureEatenCountLabel()
        configureMealsStatView()
        configureFoodContentsView()
    }
    
    func configureArcProgressBarView() {
        arcProgressBarView.resetProgressBar(ratio: 0.0)
        contentView.addSubview(arcProgressBarView)
        arcProgressBarView.snp.makeConstraints {
            $0.height.equalTo(Constants.arcProgressBarViewSize)
            $0.width.equalTo(Constants.arcProgressBarViewSize)
            $0.top.equalToSuperview().offset(Constants.arcProgressBarViewTopOffset)
            $0.left.equalToSuperview().offset(Constants.arcProgressBarViewLeftOffset)
        }
    }
    
    func configureRemainedCountLabel() {
        remainedCountLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        remainedCountLabel.textColor = Asset.Colors.label
        remainedCountLabel.textAlignment = .center
        contentView.addSubview(remainedCountLabel)
        remainedCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(arcProgressBarView.snp.centerY)
            $0.centerX.equalTo(arcProgressBarView.snp.centerX)
        }
    }
    
    func configureRemainedLabel() {
        remainedLabel.text = "Remaining"
        remainedLabel.font = .systemFont(ofSize: 14, weight: .regular)
        remainedLabel.textColor = Asset.Colors.label
        remainedLabel.textAlignment = .center
        contentView.addSubview(remainedLabel)
        remainedLabel.snp.makeConstraints {
            $0.top.equalTo(remainedCountLabel.snp.bottom)
            $0.centerX.equalTo(arcProgressBarView.snp.centerX)
        }
    }
    
    func configureKcalImageView() {
        kcalImageView.image = Asset.Images.fire
        contentView.addSubview(kcalImageView)
        kcalImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.kcalImageViewSize)
            $0.width.equalTo(Constants.kcalImageViewSize)
            $0.top.equalTo(remainedLabel.snp.bottom).offset(Constants.kcalImageViewBottomOffset)
            $0.centerX.equalTo(arcProgressBarView.snp.centerX)
        }
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
    
    func configureFoodContentsView() {
        contentView.addSubview(foodContentsView)
        foodContentsView.snp.makeConstraints {
            $0.height.equalTo(Constants.foodContentsViewHeight)
            $0.top.equalTo(mealsStatView.snp.bottom).offset(Constants.foodContentsViewTopOffset)
            $0.left.equalToSuperview().offset(Constants.foodContentsViewSideOffset)
            $0.right.equalToSuperview().offset(-Constants.foodContentsViewSideOffset)
        }
    }
}

// MARK: - Public configure

extension FFDailyStatCollectionViewCell {
    func configure(data: FFUser?) {
        guard let data else { return }

        var protein = 0.0
        var fat = 0.0
        var carbs = 0.0

        for product in data.breakfast {
            breakfastKcal = Int(product.calories * 0.01 * Double(product.eatenWeight ?? 0))
            protein = product.protein * 0.01 * Double(product.eatenWeight ?? 0)
            fat = product.fat * 0.01 * Double(product.eatenWeight ?? 0)
            carbs = product.carbs * 0.01 * Double(product.eatenWeight ?? 0)
        }
        for product in data.lunch {
            lunchKcal = Int(product.calories * 0.01 * Double(product.eatenWeight ?? 0))
            protein = product.protein * 0.01 * Double(product.eatenWeight ?? 0)
            fat = product.fat * 0.01 * Double(product.eatenWeight ?? 0)
            carbs = product.carbs * 0.01 * Double(product.eatenWeight ?? 0)
        }
        for product in data.diner {
            dinerKcal = Int(product.calories * 0.01 * Double(product.eatenWeight ?? 0))
            protein = product.protein * 0.01 * Double(product.eatenWeight ?? 0)
            fat = product.fat * 0.01 * Double(product.eatenWeight ?? 0)
            carbs = product.carbs * 0.01 * Double(product.eatenWeight ?? 0)
        }
        for product in data.snaks {
            snacksKcal = Int(product.calories * 0.01 * Double(product.eatenWeight ?? 0))
            protein = product.protein * 0.01 * Double(product.eatenWeight ?? 0)
            fat = product.fat * 0.01 * Double(product.eatenWeight ?? 0)
            carbs =  product.carbs * 0.01 * Double(product.eatenWeight ?? 0)
        }
        eatenKcal = breakfastKcal + lunchKcal + dinerKcal + snacksKcal

        eatenCountLabel.text = "\(eatenKcal) kcal"
        if data.gender == .female {
            totalKcal = 655 + Int(9.6 * data.weight) + 2 * data.height - 5 * data.age
        } else {
            totalKcal = 66 + Int(13.7 * data.weight) + 5 * data.height - 7 * data.age
        }

        let remainedKcal = totalKcal - eatenKcal < 0 ? 0 : totalKcal - eatenKcal
        remainedCountLabel.text = "\(remainedKcal) kcal"

        if eatenKcal != 0 {
            let progressPercent = Double(eatenKcal) / Double(totalKcal)
            arcProgressBarView.resetProgressBar(ratio: progressPercent)
        }

        mealsStatView.configure(
            breakfast: breakfastKcal,
            lunch: lunchKcal,
            dinner: dinerKcal,
            snakck: snacksKcal
        )

        let proteinAim = data.weight * 2.0
        let fatAim = data.weight * 1.5
        let carbsAim = data.weight * 3.0

        foodContentsView.setAim(protein: proteinAim, fat: fatAim, carbs: carbsAim)
        foodContentsView.setCurrent(protein: protein, fat: fat, carbs: carbs)
    }
}

// MARK: - Constants

private extension FFDailyStatCollectionViewCell {
    enum Constants {
        static let contentViewCornerRadius = 20.0
        
        static let arcProgressBarViewTopOffset = 32
        static let arcProgressBarViewLeftOffset = 21
        static let arcProgressBarViewSize = 124
        
        static let kcalImageViewSize = 32
        static let kcalImageViewBottomOffset = 8
        
        static let eatenLabelTopOffset = 32
        static let eatenLabelRightOffset = 189
        static let eatenCountLabelRightOffset = 19
        
        static let mealsStatViewHeight = 89
        static let mealsStatViewWidth = 170
        static let mealsStatViewTopOffset = 8
        static let mealsStatViewRightOffset = 19
        
        static let foodContentsViewHeight = 192
        static let foodContentsViewTopOffset = 17
        static let foodContentsViewSideOffset = 16
    }
}
