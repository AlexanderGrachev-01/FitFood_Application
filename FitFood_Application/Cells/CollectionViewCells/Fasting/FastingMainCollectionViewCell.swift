//
//  FastingMainCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 02.06.2023.
//

import UIKit

final class FastingMainCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingMainCollectionViewCell"

    // MARK: - Subviews

    private var fastingInfoView = FastingArcProgressBarView()
    private var percentLabel = UILabel()
    private var timeToLabel = UILabel()
    private var timerLabel = UILabel()
    private var fastingTypeBackView = UIView()
    private var fastingTypeLabel = UILabel()
    private var eatingColorView = UIView()
    private var eatingLabel = UILabel()
    private var fastingColorView = UIView()
    private var fastingLabel = UILabel()
    private var startLabel = UILabel()
    private var startTimeLabel = UILabel()
    private var finishLabel = UILabel()
    private var finishTimeLabel = UILabel()

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

private extension FastingMainCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        contentView.layer.cornerRadius = Constants.cornerRadius
        configureFastingInfoView()
        configureTimeToLabel()
        configurePercentLabel()
        configureTimerLabel()
        configureFastingTypeBackView()
        configureFastingTypeLabel()
        configureEatingLabel()
        configureEatingColorView()
        configureFastingLabel()
        configureFastingColorView()
        configureFinishLabel()
        configureFinishTimeLabel()
        configureStartLabel()
        configureStartTimeLabel()
    }

    func configureFastingInfoView() {
        fastingInfoView.resetFastingType(fastingType: .first)
        fastingInfoView.resetProgressBar(fastingRation: 1.0, eatingRetio: 0.4)
        contentView.addSubview(fastingInfoView)
        fastingInfoView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.FastingInfoView.size)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.FastingInfoView.top)
        }
    }

    func configureTimeToLabel() {
        timeToLabel.text = "Time to eat"
        timeToLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        timeToLabel.textColor = Asset.Colors.lightGray
        timeToLabel.textAlignment = .center
        contentView.addSubview(timeToLabel)
        timeToLabel.snp.makeConstraints {
            $0.centerX.equalTo(fastingInfoView)
            $0.centerY.equalTo(fastingInfoView).offset(Constants.TimeToLabel.centerY)
        }
    }

    func configurePercentLabel() {
        percentLabel.text = "40%"
        percentLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        percentLabel.textColor = Asset.Colors.orange
        percentLabel.textAlignment = .center
        contentView.addSubview(percentLabel)
        percentLabel.snp.makeConstraints {
            $0.centerX.equalTo(fastingInfoView)
            $0.bottom.equalTo(timeToLabel.snp.top).offset(-Constants.PercentLabel.bottom)
        }
    }

    func configureTimerLabel() {
        timerLabel.text = "0:40:31"
        timerLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        timerLabel.textColor = Asset.Colors.label
        timerLabel.textAlignment = .center
        contentView.addSubview(timerLabel)
        timerLabel.snp.makeConstraints {
            $0.centerX.equalTo(fastingInfoView)
            $0.top.equalTo(timeToLabel.snp.bottom).offset(Constants.TimerLabel.top)
        }
    }

    func configureFastingTypeBackView() {
        fastingTypeBackView.backgroundColor = Asset.Colors.fatingTypeViewBackground
        fastingTypeBackView.layer.cornerRadius = Constants.FastingTypeBackView.cornerRadius
        contentView.addSubview(fastingTypeBackView)
        fastingTypeBackView.snp.makeConstraints {
            $0.height.equalTo(Constants.FastingTypeBackView.height)
            $0.width.equalTo(Constants.FastingTypeBackView.width)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.FastingTypeBackView.top)
        }
    }

    func configureFastingTypeLabel() {
        fastingTypeLabel.text = "16-8"
        fastingTypeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        fastingTypeLabel.textColor = Asset.Colors.green
        fastingTypeLabel.textAlignment = .center
        fastingTypeBackView.addSubview(fastingTypeLabel)
        fastingTypeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }

    func configureEatingLabel() {
        eatingLabel.text = Asset.Strings.eating
        eatingLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        eatingLabel.textColor = Asset.Colors.lightGray
        contentView.addSubview(eatingLabel)
        eatingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Colorlabel.top)
            $0.left.equalToSuperview().offset(Constants.Colorlabel.left)
        }
    }

    func configureEatingColorView() {
        eatingColorView.backgroundColor = Asset.Colors.green
        eatingColorView.layer.cornerRadius = Constants.ColorItem.cornerRadius
        contentView.addSubview(eatingColorView)
        eatingColorView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.ColorItem.size)
            $0.right.equalTo(eatingLabel.snp.left).offset(-Constants.ColorItem.spacing)
            $0.centerY.equalTo(eatingLabel)
        }
    }

    func configureFastingLabel() {
        fastingLabel.text = Asset.Strings.fasting
        fastingLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        fastingLabel.textColor = Asset.Colors.lightGray
        fastingLabel.textAlignment = .right
        contentView.addSubview(fastingLabel)
        fastingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Colorlabel.top)
            $0.right.equalToSuperview().offset(-Constants.Colorlabel.right)
        }
    }

    func configureFastingColorView() {
        fastingColorView.backgroundColor = Asset.Colors.orange
        fastingColorView.layer.cornerRadius = Constants.ColorItem.cornerRadius
        contentView.addSubview(fastingColorView)
        fastingColorView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.ColorItem.size)
            $0.right.equalTo(fastingLabel.snp.left).offset(-Constants.ColorItem.spacing)
            $0.centerY.equalTo(eatingLabel)
        }
    }

    func configureFinishLabel() {
        finishLabel.text = Asset.Strings.finishPlan
        finishLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        finishLabel.textColor = Asset.Colors.label
        contentView.addSubview(finishLabel)
        finishLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.FinishLabel.left)
            $0.bottom.equalToSuperview().offset(-Constants.FinishLabel.bottom)
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
            $0.right.equalToSuperview().offset(-Constants.FinishTimeLabel.right)
        }
    }

    func configureStartLabel() {
        startLabel.text = Asset.Strings.start
        startLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        startLabel.textColor = Asset.Colors.label
        contentView.addSubview(startLabel)
        startLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.StartLabel.left)
            $0.bottom.equalTo(finishLabel.snp.top).offset(-Constants.StartLabel.bottom)
        }
    }

    func configureStartTimeLabel() {
        startTimeLabel.text = "19:00"
        startTimeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        startTimeLabel.textColor = Asset.Colors.green
        startTimeLabel.textAlignment = .right
        contentView.addSubview(startTimeLabel)
        startTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(startLabel)
            $0.right.equalToSuperview().offset(-Constants.FinishTimeLabel.right)
        }
    }
}

// MARK: - Constants

private extension FastingMainCollectionViewCell {
    enum Constants {
        enum FastingInfoView {
            static let size = 240
            static let top = 65
        }
        enum TimeToLabel {
            static let centerY = 3
        }
        enum TimerLabel {
            static let top = 4
        }
        enum PercentLabel {
            static let bottom = 16
        }
        enum FastingTypeBackView {
            static let height = 25
            static let width = 64
            static let top = 20
            static let cornerRadius = 16.0
        }
        enum Colorlabel {
            static let top = 65
            static let left = 32
            static let right = 20
        }
        enum ColorItem {
            static let size = 8
            static let spacing = 4
            static let cornerRadius = 4.0
        }
        enum FinishLabel {
            static let left = 20
            static let bottom = 24
        }
        enum StartLabel {
            static let left = 20
            static let bottom = 8
        }
        enum FinishTimeLabel {
            static let right = 20
        }
        enum StartTimeLabel {
            static let right = 20
        }
        static let cornerRadius = 20.0
    }
}
