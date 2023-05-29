//
//  FFDailyStepsStatCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.03.2023.
//

import UIKit

final class FFDailyStepsStatCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "DailyStepsStatCollectionViewCell"
    
    // MARK: - Subviews
    
    private var titleLabel = UILabel()
    private var backView = UIView()
    private var stepsIcon = UIImageView()
    private var moreIcon = UIImageView()
    private var progressView = RoundProgressBarView()
    private var totalLabel = UILabel()
    private var aimLabel = UILabel()
    
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

private extension FFDailyStepsStatCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitleLabel()
        configureBackView()
        configureStepsIcon()
        configureMoreIcon()
        configureProgressView()
        configureTotalLabel()
        configureAimLabel()
    }
    
    func configureTitleLabel() {
        titleLabel.text = Asset.Strings.steps
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
    
    func configureStepsIcon() {
        stepsIcon.image = Asset.Images.steps.withTintColor(Asset.Colors.secondary500)
        backView.addSubview(stepsIcon)
        stepsIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.stepsIconSize)
            $0.width.equalTo(Constants.stepsIconSize)
            $0.top.equalToSuperview().offset(Constants.stepsIconTopOffset)
            $0.left.equalToSuperview().offset(Constants.stepsIconLeftOffset)
        }
    }
    
    func configureMoreIcon() {
        moreIcon.image = Asset.Images.rightChevron.withTintColor(Asset.Colors.primary50)
        backView.addSubview(moreIcon)
        moreIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.moreIconSize)
            $0.width.equalTo(Constants.moreIconSize)
            $0.top.equalToSuperview().offset(Constants.moreIconTopOffset)
            $0.right.equalToSuperview().offset(-Constants.moreIconRightOffset)
        }
    }
    
    func configureProgressView() {
        progressView.resetProgressBar(ratio: 0.0)
        backView.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.height.equalTo(Constants.progressViewSize)
            $0.width.equalTo(Constants.progressViewSize)
            $0.top.equalToSuperview().offset(Constants.progressViewTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureTotalLabel() {
        totalLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        totalLabel.textColor = Asset.Colors.label
        totalLabel.textAlignment = .center
        backView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints {
            $0.bottom.equalTo(progressView.snp.centerY).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureAimLabel() {
        aimLabel.font = .systemFont(ofSize: 18, weight: .light)
        aimLabel.textColor = Asset.Colors.label
        aimLabel.textAlignment = .center
        backView.addSubview(aimLabel)
        aimLabel.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension FFDailyStepsStatCollectionViewCell {
    func configure(goal: Double, count: Double) {
        totalLabel.text = "\(Int(count))"
        aimLabel.text = "\(Int(goal))"

        progressView.resetProgressBar(ratio: count / goal)
    }
}

// MARK: - Constants

private extension FFDailyStepsStatCollectionViewCell {
    enum Constants {
        static let titleLabelLeftOffset = 8
        
        static let backViewTopOffset = 25
        static let backViewCornerRadius = 20.0
        
        static let stepsIconSize = 24
        static let stepsIconTopOffset = 13
        static let stepsIconLeftOffset = 12
        
        static let moreIconSize = 24
        static let moreIconTopOffset = 13
        static let moreIconRightOffset = 12
        
        static let progressViewSize = 124.0
        static let progressViewTopOffset = 77
        static let progressViewBorderWidth = 12
    }
}
