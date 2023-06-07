//
//  FFDailyFastingTimerCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.03.2023.
//

import UIKit

final class FFDailyFastingTimerCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "DailyFastingTimerCollectionViewCell"
    
    // MARK: - Subviews
    
    private var titleLabel = UILabel()
    private var backView = UIView()
    private var moreIcon = UIImageView()
    private var fastingIcon = UIImageView()
    private var infoLabel = UILabel()
    private var timerLabel = UILabel()
    
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

private extension FFDailyFastingTimerCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitleLabel()
        configureBackView()
        configureFastingIcon()
        configureMoreIcon()
        configureInfoLabel()
        configureTimerLabel()
    }
    
    func configureTitleLabel() {
        titleLabel.text = Asset.Strings.fasting
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = Asset.Colors.label
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.titleLabelLeftOffset)
        }
    }
    
    func configureBackView() {
        backView.backgroundColor = Asset.Colors.secondaryBackground
        backView.layer.cornerRadius = Constants.backViewCornerRadius
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.backViewTopOffset)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureFastingIcon() {
        fastingIcon.image = Asset.Images.steps.withTintColor(Asset.Colors.green)
        backView.addSubview(fastingIcon)
        fastingIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.fastingIconSize)
            $0.width.equalTo(Constants.fastingIconSize)
            $0.top.equalToSuperview().offset(Constants.fastingIconTopOffset)
            $0.left.equalToSuperview().offset(Constants.fastingIconLeftOffset)
        }
    }
    
    func configureMoreIcon() {
        moreIcon.image = Asset.Images.rightChevron.withTintColor(Asset.Colors.lightGreen)
        moreIcon.isHidden = true
        backView.addSubview(moreIcon)
        moreIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.moreIconSize)
            $0.width.equalTo(Constants.moreIconSize)
            $0.top.equalToSuperview().offset(Constants.moreIconTopOffset)
            $0.right.equalToSuperview().offset(-Constants.moreIconRightOffset)
        }
    }
    
    func configureInfoLabel() {
        infoLabel.text = Asset.Strings.timeToStrave
        infoLabel.textColor = Asset.Colors.btw400
        infoLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        infoLabel.textAlignment = .center
        backView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.infoLabelTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureTimerLabel() {
        timerLabel.text = "8:24:31"
        timerLabel.textColor = Asset.Colors.label
        timerLabel.font = .systemFont(ofSize: 36, weight: .semibold)
        timerLabel.textAlignment = .center
        backView.addSubview(timerLabel)
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(Constants.timerLabelTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: Public configure

extension FFDailyFastingTimerCollectionViewCell {
    func configure(fastingType: FastingType?) {
        guard let fastingType else { return }

        switch fastingType {
        case .first:
            setTimer(startTime: 19, endTime: 9)
        case .second:
            setTimer(startTime: 17, endTime: 9)
        case .third:
            setTimer(startTime: 15, endTime: 9)
        case .fourth:
            setTimer(startTime: 13, endTime: 9)
        }
    }
}

// MARK: - Utils

extension FFDailyFastingTimerCollectionViewCell {
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
            infoLabel.text = "Time to eat"
        } else if currentComponents.hour ?? 0 >= 9 {
            desiredComponents.hour = endTime
            desiredComponents.day = (currentComponents.day ?? 0) + 1
            infoLabel.text = "Time to faste"
        } else {
            desiredComponents.hour = endTime
            desiredComponents.day = currentComponents.day
            infoLabel.text = "Time to faste"
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

            if timeRemaining <= 0 {
                timer.invalidate()
                print("Таймер завершился!")
            }
        }

        RunLoop.main.add(timer, forMode: .common)
        timer.fire()
    }
}

// MARK: - Constants

private extension FFDailyFastingTimerCollectionViewCell {
    enum Constants {
        static let titleLabelLeftOffset = 8
        
        static let backViewTopOffset = 25
        static let backViewCornerRadius = 20.0
        
        static let fastingIconSize = 24
        static let fastingIconTopOffset = 13
        static let fastingIconLeftOffset = 12
        
        static let moreIconSize = 24
        static let moreIconTopOffset = 13
        static let moreIconRightOffset = 12
        
        static let infoLabelTopOffset = 34
        
        static let timerLabelTopOffset = 2
    }
}

