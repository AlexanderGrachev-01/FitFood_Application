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
    
    private var selectedMeal: Meals = .breakfast {
        didSet {
            breakfastButton.isPicked = selectedMeal == .breakfast
            lunchButton.isPicked = selectedMeal == .lunch
            dinerButton.isPicked = selectedMeal == .diner
            snacksButton.isPicked = selectedMeal == .snacks
        }
    }
    
    private let buttonTitles = [Asset.Strings.breakfast, Asset.Strings.lunch, Asset.Strings.dinner, Asset.Strings.snack]
    
    // MARK: - Handlers
    
    var onSeeAll: (() -> Void)?
    var onChangeMeal: ((_ meal: Meals) -> Void)?

    // MARK: - Subviews
    
    private var titleLabel = UILabel()
    private var seeAllButton = UIButton()
    private var stackView = UIStackView()
    private var breakfastButton = FFButton()
    private var lunchButton = FFButton()
    private var dinerButton = FFButton()
    private var snacksButton = FFButton()
    
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
        configureLunchButton()
        configureDinerButton()
        configureSnacksButton()
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
        seeAllButton.addTarget(self, action: #selector(seeAllAction), for: .touchUpInside)
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
            button.setTitle(buttonTitles[index], for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    func configureBreakfastButton() {
        breakfastButton.isPicked = true
        breakfastButton.addTarget(self, action: #selector(breakfastAction), for: .touchDown)
    }
    
    func configureLunchButton() {
        lunchButton.addTarget(self, action: #selector(lunchAction), for: .touchDown)
    }
    
    func configureDinerButton() {
        dinerButton.addTarget(self, action: #selector(dinerAction), for: .touchDown)
    }
    
    func configureSnacksButton() {
        snacksButton.addTarget(self, action: #selector(snacksAction), for: .touchDown)
    }
}

// MARK: - Actions

extension PopularMenusHeaderCell {
    @objc
    private func seeAllAction() {
        onSeeAll?()
    }
    
    @objc
    private func breakfastAction() {
        selectedMeal = .breakfast
        onChangeMeal?(selectedMeal)
    }
    
    @objc
    private func lunchAction() {
        selectedMeal = .lunch
        onChangeMeal?(selectedMeal)
    }
    
    @objc
    private func dinerAction() {
        selectedMeal = .diner
        onChangeMeal?(selectedMeal)
    }
    
    @objc
    private func snacksAction() {
        selectedMeal = .snacks
        onChangeMeal?(selectedMeal)
    }
}

// MARK: - Constants

private extension PopularMenusHeaderCell {
    enum Constants {
        static let titleLabelLeftOffset = 3
        
        static let stackViewSpacing = 12.0
        static let stackViewHeight = 44
        static let stackViewTopOffset = 16
    }
}
