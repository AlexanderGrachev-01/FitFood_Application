//
//  СookingStepCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.05.2023.
//

import UIKit

final class СookingStepCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "СookingStepCollectionViewCell"

    // MARK: - Subviews

    private var stepLabel = UILabel()
    private var timeLabel = UILabel()
    private var textLabel = UILabel()

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

private extension СookingStepCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.radius
        configureStepLabel()
        configureTimeLabel()
        configureTextLabel()
    }

    func configureStepLabel() {
        stepLabel.font = .systemFont(ofSize: 20, weight: .medium)
        stepLabel.textColor = Asset.Colors.green
        contentView.addSubview(stepLabel)
        stepLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.StepLabel.top)
            $0.left.equalToSuperview().offset(Constants.StepLabel.left)
        }
    }

    func configureTimeLabel() {
        timeLabel.font = .systemFont(ofSize: 16, weight: .regular)
        timeLabel.textColor = Asset.Colors.lightGray
        timeLabel.textAlignment = .right
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.bottom.equalTo(stepLabel.snp.bottom)
            $0.right.equalToSuperview().offset(-Constants.TimeLabel.right)
        }
    }

    func configureTextLabel() {
        textLabel.font = .systemFont(ofSize: 18, weight: .regular)
        textLabel.textColor = Asset.Colors.label
        textLabel.numberOfLines = 4
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.6
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.top.equalTo(stepLabel.snp.bottom).offset(Constants.TextView.top)
            $0.left.equalToSuperview().offset(Constants.TextView.left)
            $0.right.equalToSuperview().offset(-Constants.TextView.right)
        }
    }
}

// MARK: - Public configure

extension СookingStepCollectionViewCell {
    func configure(step: FFCookingStep?) {
        guard let step = step else { return }

        stepLabel.text = "Step \(step.number)"
        timeLabel.text = "\(step.time) min"
        textLabel.text = step.text
    }
}

// MARK: - Constants

private extension СookingStepCollectionViewCell {
    enum Constants {
        enum StepLabel {
            static let top = 16
            static let left = 16
        }
        enum TimeLabel {
            static let right = 16
        }
        enum TextView {
            static let top = 10
            static let left = 16
            static let right = 8
            static let bottom = 16
        }
        static let radius = 16.0
    }
}
