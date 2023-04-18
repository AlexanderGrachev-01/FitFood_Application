//
//  PopularMenusHeaderCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 17.04.2023.
//

import UIKit

final class PopularMenusHeaderCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "PopularMenusHeaderCell"
    
    // MARK: - Properties
    
    private let buttonTitles = [Asset.Strings.breakfast, Asset.Strings.lunch, Asset.Strings.dinner, Asset.Strings.snack]

    // MARK: - Subviews
    
    private lazy var titleLabel = UILabel()
    private lazy var seeAllButton = UIButton()
    private lazy var stackView = UIStackView()
    private lazy var breakfastButton = UIButton()
    private lazy var lunchButton = UIButton()
    private lazy var dinerButton = UIButton()
    private lazy var snacksButton = UIButton()
    
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

private extension PopularMenusHeaderCell {
    func configureViews() {
        configureTitleLabel()
        configureSeeAllButton()
        configureStackView()
        configureBreakfastButton()
    }
    
    func configureTitleLabel() {
        titleLabel.text = Asset.Strings.popularMenus
        titleLabel.textColor = Asset.Colors.label
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.titleLabelLeftOffset)
        }
    }
    
    func configureSeeAllButton() {
        seeAllButton.setTitle(Asset.Strings.seeAll, for: .normal)
        seeAllButton.setTitleColor(Asset.Colors.green, for: .normal)
        seeAllButton.setTitleColor(Asset.Colors.lightGreen, for: .highlighted)
        contentView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.right.equalToSuperview()
        }
    }
    
    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.stackViewSpacing
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.height.equalTo(Constants.stackViewHeight)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constants.stackViewTopOffset)
        }
        
        let buttons = [breakfastButton, lunchButton, dinerButton, snacksButton]
        for (index, button) in buttons.enumerated() {
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
            button.setTitle(buttonTitles[index], for: .normal)
            button.setTitleColor(Asset.Colors.label, for: .normal)
            button.setTitleColor(Asset.Colors.white, for: .highlighted)
            button.layer.borderWidth = Constants.buttonBorderWidth
            button.layer.cornerRadius = Constants.buttonCornerRadius
            button.layer.borderColor = Asset.Colors.lightGreen.cgColor
            stackView.addArrangedSubview(button)
        }
    }
    
    func configureBreakfastButton() {
        breakfastButton.backgroundColor = Asset.Colors.green
        breakfastButton.setTitleColor(Asset.Colors.white, for: .normal)
    }
    
    func configureLunchButton() {
        
    }
    
    func configureDinerButton() {
        
    }
    
    func configureSnacksButton() {
        
    }
}

// MARK: - Constants

private extension PopularMenusHeaderCell {
    enum Constants {
        static let titleLabelLeftOffset = 3
        
        static let stackViewSpacing = 12.0
        static let stackViewHeight = 44
        static let stackViewTopOffset = 16
        
        static let buttonBorderWidth = 1.0
        static let buttonCornerRadius = 16.0
    }
}
