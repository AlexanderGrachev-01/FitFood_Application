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

    // MARK: - Properties

    private var fastingType: FastingType = .first
    private var mealType: MealType = .fasting

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

    override func prepareForReuse() {
        super.prepareForReuse()

        timerLabel.text = ""
        timeToLabel.text = ""
        percentLabel.text = ""
        fastingInfoView.resetProgressBar(
            fastingRation: 0.0,
            eatingRetio: 0.0
        )

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
        contentView.addSubview(fastingInfoView)
        fastingInfoView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.FastingInfoView.size)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.FastingInfoView.top)
        }
    }

    func configureTimeToLabel() {
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

// MARK: - Public configure

extension FastingMainCollectionViewCell {
    func configure(fastingType: FastingType?) {
        guard let fastingType else { return }

        fastingInfoView.resetFastingType(fastingType: fastingType)
        fastingInfoView.resetProgressBar(fastingRation: 1.0, eatingRetio: 0.4)

        switch fastingType {
        case .first:
            fastingTypeLabel.text = "14-10"
            startTimeLabel.text = "19:00"
            finishTimeLabel.text = "09:00"
            setTimer(startTime: 19, endTime: 9)
        case .second:
            fastingTypeLabel.text = "16-8"
            startTimeLabel.text = "17:00"
            finishTimeLabel.text = "09:00"
            setTimer(startTime: 17, endTime: 9)
        case .third:
            fastingTypeLabel.text = "18-6"
            startTimeLabel.text = "15:00"
            finishTimeLabel.text = "09:00"
            setTimer(startTime: 15, endTime: 9)
        case .fourth:
            fastingTypeLabel.text = "20-4"
            startTimeLabel.text = "13:00"
            finishTimeLabel.text = "09:00"
            setTimer(startTime: 13, endTime: 9)
        }
    }
}

// MARK: - Utils

extension FastingMainCollectionViewCell {
    private func setTimer(startTime: Int, endTime: Int) {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate)

        var desiredComponents = DateComponents()
        var startTimeComponents = DateComponents()
        var endTimeComponents = DateComponents()

        desiredComponents.minute = 0
        desiredComponents.second = 0
        desiredComponents.year = currentComponents.year
        desiredComponents.month = currentComponents.month

        if  currentComponents.hour ?? 0 >= 9, startTime >= currentComponents.hour ?? 0 {
            desiredComponents.hour = startTime
            desiredComponents.day = currentComponents.day
            mealType = .eating
        } else if currentComponents.hour ?? 0 >= 9 {
            desiredComponents.hour = endTime
            desiredComponents.day = (currentComponents.day ?? 0) + 1
            mealType = .fasting
        } else {
            desiredComponents.hour = endTime
            desiredComponents.day = currentComponents.day
            mealType = .morningFasting
        }

        let desiredDate = calendar.date(from: desiredComponents)!
        let timeInterval = desiredDate.timeIntervalSince(currentDate)

        let timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self else { return }

            let timeRemaining = Int(desiredDate.timeIntervalSinceNow)

            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            let formattedTime = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeRemaining)))

            self.timerLabel.text = formattedTime
            switch self.mealType {
            case .morningFasting:
                timeToLabel.text = "Time to faste"
                let percent = Double(timeRemaining) / Double((endTime + (24 - startTime)) * 3600)
                percentLabel.text = "\(Int(percent * 100))%"
                fastingInfoView.resetProgressBar(
                    fastingRation: 1.0,
                    eatingRetio: percent
                )
            case .eating:
                timeToLabel.text = "Time to eat"
                let percent = Double(timeRemaining) / Double((startTime - endTime) * 3600)
                percentLabel.text = "\(Int(percent * 100))%"
                fastingInfoView.resetProgressBar(
                    fastingRation: 0.0,
                    eatingRetio: percent
                )
            case .fasting:
                timeToLabel.text = "Time to faste"
                let percent = Double(timeRemaining) / Double((endTime + (24 - startTime)) * 3600)
                percentLabel.text = "\(Int(percent * 100))%"
                fastingInfoView.resetProgressBar(
                    fastingRation: percent
                    , eatingRetio: 1.0
                )
            }

            if timeRemaining <= 0 {
                timer.invalidate()
                print("Таймер завершился!")
            }
        }

        RunLoop.main.add(timer, forMode: .common)
        timer.fire()
    }
}

//startTimeComponents.minute = 0
//startTimeComponents.second = 0
//startTimeComponents.year = currentComponents.year
//startTimeComponents.month = currentComponents.month
//
//endTimeComponents.minute = 0
//endTimeComponents.second = 0
//endTimeComponents.year = currentComponents.year
//endTimeComponents.month = currentComponents.month

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
