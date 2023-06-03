//
//  FastingSetupInfoCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class FastingSetupInfoCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingSetupInfoCollectionViewCell"

    // MARK: - Subviews

    private var fastingTypeLabel = UILabel()
    private var startLabel = UILabel()
    private var startTimeLabel = UILabel()
    private var finishLabel = UILabel()
    private var finishTimeLabel = UILabel()
    private var complexityLabel = UILabel()
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

private extension FastingSetupInfoCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = Constants.cornerRadius
        configureFastingTypeLabel()
        configureComplexityLabel()
        configureComplexityView()
        configureFinishLabel()
        configureFinishTimeLabel()
        configureStartLabel()
        configureStartTimeLabel()
        
    }

    func configureFastingTypeLabel() {
        fastingTypeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        fastingTypeLabel.textColor = Asset.Colors.label
        contentView.addSubview(fastingTypeLabel)
        fastingTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }

    func configureComplexityLabel() {
        complexityLabel.text = Asset.Strings.difficultyLevel
        complexityLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        complexityLabel.textColor = Asset.Colors.label
        contentView.addSubview(complexityLabel)
        complexityLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configureComplexityView() {
        contentView.addSubview(complexityView)
        complexityView.snp.makeConstraints {
            $0.height.equalTo(Constants.ComplexityView.height)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configureFinishLabel() {
        finishLabel.text = Asset.Strings.finishPlan
        finishLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        finishLabel.textColor = Asset.Colors.label
        contentView.addSubview(finishLabel)
        finishLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.bottom.equalTo(complexityLabel.snp.top).offset(-Constants.itemSpacing)
        }
    }

    func configureFinishTimeLabel() {
        finishTimeLabel.text = "09:00"
        finishTimeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        finishTimeLabel.textColor = Asset.Colors.green
        finishTimeLabel.textAlignment = .right
        contentView.addSubview(finishTimeLabel)
        finishTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(finishLabel)
            $0.right.equalToSuperview()
        }
    }

    func configureStartLabel() {
        startLabel.text = Asset.Strings.start
        startLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        startLabel.textColor = Asset.Colors.label
        contentView.addSubview(startLabel)
        startLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.bottom.equalTo(finishLabel.snp.top).offset(-Constants.itemSpacing)
        }
    }

    func configureStartTimeLabel() {
        startTimeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        startTimeLabel.textColor = Asset.Colors.green
        startTimeLabel.textAlignment = .right
        contentView.addSubview(startTimeLabel)
        startTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(startLabel)
            $0.right.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension FastingSetupInfoCollectionViewCell {
    func configure(fastingType: FastingType) {
        fastingTypeLabel.text = fastingType.rawValue

        switch fastingType {
        case .first:
            startTimeLabel.text = "19:00"
            complexityView.configure(raiting: 1)
        case .second:
            startTimeLabel.text = "17:00"
            complexityView.configure(raiting: 3)
        case .third:
            startTimeLabel.text = "15:00"
            complexityView.configure(raiting: 4)
        case .fourth:
            startTimeLabel.text = "13:00"
            complexityView.configure(raiting: 5)
        }
    }
}

// MARK: - Constants

private extension FastingSetupInfoCollectionViewCell {
    enum Constants {
        enum ComplexityView {
            static let height = 16
            static let width = 88
            static let right = 20
        }
        static let itemSpacing = 8
        static let cornerRadius = 20.0
    }
}
