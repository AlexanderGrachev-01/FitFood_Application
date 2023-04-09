//
//  ProgressView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.04.2023.
//

import UIKit

class ProgressView: UIView {
    // MARK: - Subviews
    
    private lazy var titleLabel = UILabel()
    private lazy var scoreLabel = UILabel()
    private lazy var backView = UIView()
    private lazy var scoreView = UIView()
    
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

private extension ProgressView {
    func configureViews() {
        backgroundColor = .clear
        configureTitleLabel()
        configureScoreLabel()
        configureBackView()
        configureScoreView()
    }
    
    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = Asset.Colors.label
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
    }
    
    func configureScoreLabel() {
        scoreLabel.font = .systemFont(ofSize: 16, weight: .regular)
        scoreLabel.textColor = Asset.Colors.label
        scoreLabel.textAlignment = .right
        addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    func configureBackView() {
        backView.layer.cornerRadius = Constants.viewsCornerRadius
        backView.clipsToBounds = true
        addSubview(backView)
        backView.snp.makeConstraints {
            $0.height.equalTo(Constants.viewsHeight)
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constants.viewsTopOffset)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    func configureScoreView() {
        scoreView.layer.cornerRadius = Constants.viewsCornerRadius
        backView.addSubview(scoreView)
        scoreView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}

// MARK: - Public methods

extension ProgressView {
    func configure(_ title: String, _ backViewColor: UIColor, _ scoreViewColor: UIColor) {
        titleLabel.text = title
        backView.backgroundColor = backViewColor
        scoreView.backgroundColor = scoreViewColor
    }
    
    func calculateScore(_ total: Double, _ aim: Double, _ abbreviation: String) {
        scoreLabel.text = "\(Int(total))/\(Int(aim))\(abbreviation)"
        let ratio = total / aim
        scoreView.snp.removeConstraints()
        scoreView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(backView.snp.width).multipliedBy(ratio)
        }
    }
}

// MARK: - Constants

private extension ProgressView {
    enum Constants {
        static let viewsCornerRadius = 6.0
        static let viewsTopOffset = 4
        static let viewsHeight = 13
    }
}
