//
//  FoodContentsView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.04.2023.
//

import UIKit

class FoodContentsView: UIView {
    // MARK: - Properties

    private var aimProtein = 102.0
    private var aimFat = 60.0
    private var aimCarbs = 180.0

    private var curProtein = 0.0
    private var curFat = 0.0
    private var curCarbs = 0.0

    // MARK: - Subviews
    
    private var proteinImageView = UIImageView()
    private var fatImageView = UIImageView()
    private var carbsImageView = UIImageView()
    private var proteinProgressView = ProgressView()
    private var fatProgressView = ProgressView()
    private var carbsProgressView = ProgressView()
    
    
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

private extension FoodContentsView {
    func configureViews() {
        backgroundColor = .clear
        configureProteinImageView()
        congigureProteinProgressView()
        configureFatImageView()
        configureFatProgressView()
        configureCarbsImageView()
        configureCarbsProgressView()
        resetProgress()
    }
    
    func configureProteinImageView() {
        proteinImageView.image = Asset.Images.protein
        addSubview(proteinImageView)
        proteinImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.imageViewsSize)
            $0.width.equalTo(Constants.imageViewsSize)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
    }
    
    func congigureProteinProgressView() {
        proteinProgressView.configure(Asset.Strings.protein, Asset.Colors.lightBlue, Asset.Colors.blue)
        addSubview(proteinProgressView)
        proteinProgressView.snp.makeConstraints {
            $0.height.equalTo(Constants.progressViewsHeight)
            $0.centerY.equalTo(proteinImageView.snp.centerY)
            $0.left.equalTo(proteinImageView.snp.right).offset(Constants.progressViewsLeftOffset)
            $0.right.equalToSuperview()
        }
    }
    
    func configureFatImageView() {
        fatImageView.image = Asset.Images.fat
        addSubview(fatImageView)
        fatImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.imageViewsSize)
            $0.width.equalTo(Constants.imageViewsSize)
            $0.top.equalTo(proteinImageView.snp.bottom).offset(Constants.imageViewsSpacing)
            $0.left.equalToSuperview()
        }
    }
    
    func configureFatProgressView() {
        fatProgressView.configure(Asset.Strings.fat, Asset.Colors.progressFatLight, Asset.Colors.progressFat)
        addSubview(fatProgressView)
        fatProgressView.snp.makeConstraints {
            $0.height.equalTo(Constants.progressViewsHeight)
            $0.centerY.equalTo(fatImageView.snp.centerY)
            $0.left.equalTo(fatImageView.snp.right).offset(Constants.progressViewsLeftOffset)
            $0.right.equalToSuperview()
        }
    }
    
    func configureCarbsImageView() {
        carbsImageView.image = Asset.Images.carbs
        addSubview(carbsImageView)
        carbsImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.imageViewsSize)
            $0.width.equalTo(Constants.imageViewsSize)
            $0.top.equalTo(fatImageView.snp.bottom).offset(Constants.imageViewsSpacing)
            $0.left.equalToSuperview()
        }
    }
    
    func configureCarbsProgressView() {
        carbsProgressView.configure(Asset.Strings.carbs, Asset.Colors.lightOrange, Asset.Colors.orange)
        addSubview(carbsProgressView)
        carbsProgressView.snp.makeConstraints {
            $0.height.equalTo(Constants.progressViewsHeight)
            $0.centerY.equalTo(carbsImageView.snp.centerY)
            $0.left.equalTo(carbsImageView.snp.right).offset(Constants.progressViewsLeftOffset)
            $0.right.equalToSuperview()
        }
    }
}

// MARK: - Action

private extension FoodContentsView {
    func resetProgress() {
        proteinProgressView.calculateScore(curProtein, aimProtein, "g")
        fatProgressView.calculateScore(curFat, aimFat, "g")
        carbsProgressView.calculateScore(curCarbs, aimCarbs, "g")
    }
}

// MARK: - Public configure

extension FoodContentsView {
    func setAim(protein: Double, fat: Double, carbs: Double) {
        aimProtein = protein
        aimFat = fat
        aimCarbs = carbs
        resetProgress()
    }

    func setCurrent(protein: Double, fat: Double, carbs: Double) {
        curProtein = protein
        curFat = fat
        curCarbs = carbs
        resetProgress()
    }
}

// MARK: - Constants

private extension FoodContentsView {
    enum Constants {
        static let imageViewsSize = 56
        static let imageViewsSpacing = 12
        
        static let progressViewsHeight = 36
        static let progressViewsLeftOffset = 24
    }
}
