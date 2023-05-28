//
//  FFDailyWaterStatCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.03.2023.
//

import UIKit

final class FFDailyWaterStatCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "DailyWaterStatCollectionViewCell"
    
    // MARK: - Handlers
    
    var onMinusButton: (() -> Void)?
    var onPlusButton: (() -> Void)?
    
    // MARK: - Subviews
    
    private var titleLabel = UILabel()
    private var backView = UIView()
    private var backgroundImageView = UIImageView()
    private var moreIcon = UIImageView()
    private var totalLabel = UILabel()
    private var aimLabel = UILabel()
    private var plusButton = UIButton()
    private var minusButton = UIButton()
    private var cupIcon = UIImageView()
    
    
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

private extension FFDailyWaterStatCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitleLabel()
        configureBackView()
        configureBackgroundImageView()
        configureMoreIcon()
        configureTotalLabel()
        configureAimLabel()
        configureCupIcon()
        configureMinusButton()
        configurePlusButton()
    }
    
    func configureTitleLabel() {
        titleLabel.text = Asset.Strings.water
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
    
    func configureBackgroundImageView() {
        backgroundImageView.image = Asset.Images.drinkBackground
        backView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureMoreIcon() {
        moreIcon.image = Asset.Images.rightChevron.withTintColor(Asset.Colors.blue)
        backView.addSubview(moreIcon)
        moreIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.moreIconSize)
            $0.width.equalTo(Constants.moreIconSize)
            $0.top.equalToSuperview().offset(Constants.moreIconTopOffset)
            $0.right.equalToSuperview().offset(-Constants.moreIconRightOffset)
        }
    }
    
    func configureTotalLabel() {
        totalLabel.text = "900"
        totalLabel.textColor = Asset.Colors.label
        totalLabel.textAlignment = .center
        totalLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        backView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.totalLabelTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureAimLabel() {
        aimLabel.text = "/ 2000 ml"
        aimLabel.textColor = Asset.Colors.label
        aimLabel.textAlignment = .center
        aimLabel.font = .systemFont(ofSize: 18, weight: .light)
        backView.addSubview(aimLabel)
        aimLabel.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCupIcon() {
        cupIcon.image = Asset.Images.cup.withTintColor(Asset.Colors.blue)
        backView.addSubview(cupIcon)
        cupIcon.snp.makeConstraints {
            $0.height.equalTo(Constants.cupIconSize)
            $0.width.equalTo(Constants.cupIconSize)
            $0.top.equalTo(aimLabel.snp.bottom).offset(Constants.cupIconTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureMinusButton() {
        minusButton.setBackgroundImage(Asset.Images.minusButton, for: .normal)
        minusButton.layer.cornerRadius = Constants.buttonsSize / 2
        minusButton.addTarget(self, action: #selector(minusButtonAction), for: .touchUpInside)
        backView.addSubview(minusButton)
        minusButton.snp.makeConstraints {
            $0.height.equalTo(Constants.buttonsSize)
            $0.width.equalTo(Constants.buttonsSize)
            $0.centerY.equalTo(cupIcon.snp.centerY)
            $0.right.equalTo(cupIcon.snp.left).offset(-Constants.buttonsSideOffset)
        }
    }
    
    func configurePlusButton() {
        plusButton.setBackgroundImage(Asset.Images.plusButton, for: .normal)
        plusButton.layer.cornerRadius = Constants.buttonsSize / 2
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        backView.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.height.equalTo(Constants.buttonsSize)
            $0.width.equalTo(Constants.buttonsSize)
            $0.centerY.equalTo(cupIcon.snp.centerY)
            $0.left.equalTo(cupIcon.snp.right).offset(Constants.buttonsSideOffset)
        }
    }
}

// MARK: - Actions

extension FFDailyWaterStatCollectionViewCell {
    @objc
    private func minusButtonAction() {
        onMinusButton?()
    }
    
    @objc
    private func plusButtonAction() {
        onPlusButton?()
    }
}

// MARK: - Constants

private extension FFDailyWaterStatCollectionViewCell {
    enum Constants {
        static let titleLabelLeftOffset = 8
        
        static let backViewTopOffset = 25
        static let backViewCornerRadius = 20.0
        
        static let moreIconSize = 24
        static let moreIconTopOffset = 13
        static let moreIconRightOffset = 12
        
        static let totalLabelTopOffset = 43
        
        static let cupIconSize = 24
        static let cupIconTopOffset = 32
        
        static let buttonsSize = 44.0
        static let buttonsSideOffset = 16
    }
}
