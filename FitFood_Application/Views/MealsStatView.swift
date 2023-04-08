//
//  MealsStatView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.04.2023.
//

import UIKit

class MealsStatView: UIView {
    // MARK: - Subviews
    
    private lazy var leftStackView = UIStackView()
    private lazy var breakfastLabel = UILabel()
    private lazy var lunchLabel = UILabel()
    private lazy var dinnerLabel = UILabel()
    private lazy var snackLabel = UILabel()
    private lazy var rightStackView = UIStackView()
    private lazy var breakfastCountLabel = UILabel()
    private lazy var lunchCountLabel = UILabel()
    private lazy var dinnerCountLabel = UILabel()
    private lazy var snackCountLabel = UILabel()
    
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

private extension MealsStatView {
    func configureViews() {
        backgroundColor = .clear
        configureLeftStackView()
        configurerRightStackView()
    }
    
    func configureLeftStackView() {
        breakfastLabel.text = Asset.Strings.breakfast
        lunchLabel.text = Asset.Strings.lunch
        dinnerLabel.text = Asset.Strings.dinner
        snackLabel.text = Asset.Strings.snack
        
        let labels = [breakfastLabel, lunchLabel, dinnerLabel, snackLabel]
        for label in labels {
            label.textColor = Asset.Colors.label
            label.font = .systemFont(ofSize: 14, weight: .medium)
            leftStackView.addArrangedSubview(label)
        }
        
        leftStackView.axis = .vertical
        leftStackView.spacing = Constants.stackViewSpacing
        addSubview(leftStackView)
        leftStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configurerRightStackView() {
        breakfastCountLabel.text = "600 kcal"
        lunchCountLabel.text = "720 kcal"
        dinnerCountLabel.text = "0 kcal"
        snackCountLabel.text = "234 kcal"
        
        let labels = [breakfastCountLabel, lunchCountLabel, dinnerCountLabel, snackCountLabel]
        for label in labels {
            label.textColor = Asset.Colors.label
            label.textAlignment = .right
            label.font = .systemFont(ofSize: 14, weight: .light)
            rightStackView.addArrangedSubview(label)
        }
        
        rightStackView.axis = .vertical
        rightStackView.spacing = Constants.stackViewSpacing
        addSubview(rightStackView)
        rightStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - Constants

private extension MealsStatView {
    enum Constants {
        static let stackViewSpacing = 7.0
    }
}