//
//  FastingVariantCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class FastingVariantCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingVariantCollectionViewCell"

    // MARK: - Subviews

    private var fastingTypeLabel = UILabel()
    private var fastingTimeLabel = UILabel()
    private var mealTimeLabel = UILabel()
    private var complexityView = StarsRatingView()

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

private extension FastingVariantCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.cornerRadius
        configureFastingTypeLabel()
        configureComplexityView()
        configureMealTimeLabel()
        configureFastingTimeLabel()
    }

    func configureFastingTypeLabel() {
        fastingTypeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        fastingTypeLabel.textColor = Asset.Colors.label
        contentView.addSubview(fastingTypeLabel)
        fastingTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.FastingTypeLabel.top)
            $0.left.equalToSuperview().offset(Constants.FastingTypeLabel.left)
        }
    }

    func configureComplexityView() {
        contentView.addSubview(complexityView)
        complexityView.snp.makeConstraints {
            $0.height.equalTo(Constants.ComplexityView.height)
            $0.width.equalTo(Constants.ComplexityView.width)
            $0.top.equalToSuperview().offset(Constants.ComplexityView.top)
            $0.right.equalToSuperview().offset(-Constants.ComplexityView.right)
        }
    }

    func configureMealTimeLabel() {
        mealTimeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        mealTimeLabel.textColor = Asset.Colors.label
        contentView.addSubview(mealTimeLabel)
        mealTimeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.MealTimeLabel.left)
            $0.bottom.equalToSuperview().offset(-Constants.MealTimeLabel.bottom)
        }
    }

    func configureFastingTimeLabel() {
        fastingTimeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        fastingTimeLabel.textColor = Asset.Colors.label
        contentView.addSubview(fastingTimeLabel)
        fastingTimeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.FastingTimeLabel.left)
            $0.bottom.equalTo(mealTimeLabel.snp.top).offset(-Constants.FastingTimeLabel.bottom)
        }
    }
}

// MARK: - Constants

extension FastingVariantCollectionViewCell {
    func configure(fastingType: FastingType) {
        switch fastingType {
        case .first:
            fastingTypeLabel.text = "14-10"
            fastingTimeLabel.text = "14"
            mealTimeLabel.text = "10"
            complexityView.configure(raiting: 1)
        case .second:
            fastingTypeLabel.text = "16-8"
            fastingTimeLabel.text = "16"
            mealTimeLabel.text = "8"
            complexityView.configure(raiting: 3)
        case .third:
            fastingTypeLabel.text = "18-6"
            fastingTimeLabel.text = "18"
            mealTimeLabel.text = "6"
            complexityView.configure(raiting: 4)
        case .fourth:
            fastingTypeLabel.text = "20-4"
            fastingTimeLabel.text = "20"
            mealTimeLabel.text = "4"
            complexityView.configure(raiting: 5)
        }
    }
}

// MARK: - Constants

private extension FastingVariantCollectionViewCell {
    enum Constants {
        enum FastingTypeLabel {
            static let top = 20
            static let left = 20
        }
        enum MealTimeLabel {
            static let left = 20
            static let bottom = 20
        }
        enum FastingTimeLabel {
            static let left = 20
            static let bottom = 4
        }
        enum ComplexityView {
            static let height = 16
            static let width = 88
            static let top = 20
            static let right = 20
        }
        static let cornerRadius = 20.0
    }
}
