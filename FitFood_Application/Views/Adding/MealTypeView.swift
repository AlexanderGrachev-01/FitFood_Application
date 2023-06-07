//
//  MealTypeView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 07.06.2023.
//

import UIKit

final class MealTypeView: UIView {
    // MARK: - Handlers

    var onSelectType: ((_ mealType: MealType) -> Void)?

    // MARK: - Subviews

    private var breakfastButton = UIButton()
    private var lunchButton = UIButton()
    private var dinerButton = UIButton()
    private var snacksButton = UIButton()

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

private extension MealTypeView {
    func configureViews() {
        backgroundColor = Asset.Colors.background.withAlphaComponent(0.7)
        configureSnacksButton()
        configureDinerButton()
        configureLunchButton()
        configureBreakfastButton()
    }

    func configureBreakfastButton() {
        breakfastButton.addAction(
            UIAction { [weak self] _ in
                self?.setMealType(type: .breakfast)
            },
            for: .touchUpInside
        )
        breakfastButton.setTitle(Asset.Strings.breakfast, for: .normal)
        breakfastButton.setTitleColor(Asset.Colors.label, for: .normal)
        breakfastButton.backgroundColor = Asset.Colors.green
        breakfastButton.layer.cornerRadius = Constants.Button.cornerRadius
        addSubview(breakfastButton)
        breakfastButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.width.equalTo(Constants.Button.width)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(lunchButton.snp.top).offset(-Constants.Button.bottom)
        }
    }

    func configureLunchButton() {
        lunchButton.addAction(
            UIAction { [weak self] _ in
                self?.setMealType(type: .lunch)
            },
            for: .touchUpInside
        )
        lunchButton.setTitle(Asset.Strings.lunch, for: .normal)
        lunchButton.setTitleColor(Asset.Colors.label, for: .normal)
        lunchButton.backgroundColor = Asset.Colors.green
        lunchButton.layer.cornerRadius = Constants.Button.cornerRadius
        addSubview(lunchButton)
        lunchButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.width.equalTo(Constants.Button.width)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(dinerButton.snp.top).offset(-Constants.Button.bottom)
        }
    }

    func configureDinerButton() {
        dinerButton.addAction(
            UIAction { [weak self] _ in
                self?.setMealType(type: .diner)
            },
            for: .touchUpInside
        )
        dinerButton.setTitle(Asset.Strings.dinner, for: .normal)
        dinerButton.setTitleColor(Asset.Colors.label, for: .normal)
        dinerButton.backgroundColor = Asset.Colors.green
        dinerButton.layer.cornerRadius = Constants.Button.cornerRadius
        addSubview(dinerButton)
        dinerButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.width.equalTo(Constants.Button.width)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(snacksButton.snp.top).offset(-Constants.Button.bottom)
        }
    }

    func configureSnacksButton() {
        snacksButton.addAction(
            UIAction { [weak self] _ in
                self?.setMealType(type: .snacks)
            },
            for: .touchUpInside
        )
        snacksButton.setTitle(Asset.Strings.snack, for: .normal)
        snacksButton.setTitleColor(Asset.Colors.label, for: .normal)
        snacksButton.backgroundColor = Asset.Colors.green
        snacksButton.layer.cornerRadius = Constants.Button.cornerRadius
        addSubview(snacksButton)
        snacksButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Button.height)
            $0.width.equalTo(Constants.Button.width)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-Constants.Button.bottom)
        }
    }
}

// MARK: - Action

extension MealTypeView {
    private func setMealType(type: MealType) {
        onSelectType?(type)
    }
}

// MARK: - Constants

private extension MealTypeView {
    enum Constants {
        enum Button {
            static let height = 44
            static let width = 200
            static let bottom = 14
            static let cornerRadius = 16.0
        }
    }
}
