//
//  HeaderCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 19.04.2023.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "HeaderCollectionViewCell"
    
    // MARK: - Properties
    
    var isSeeAllButtonHidden = false {
        didSet {
            seeAllButton.isHidden = isSeeAllButtonHidden
        }
    }
    
    // MARK: - Handlers
    
    var onSeeAll: (() -> Void)?
    
    // MARK: - Subviews
    
    private lazy var titleLabel = UILabel()
    private lazy var seeAllButton = UIButton()
    
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

private extension HeaderCollectionViewCell {
    func configureViews() {
        configureTitleLabel()
        configureSeeAllButton()
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
}

// MARK: - Public

extension HeaderCollectionViewCell {
    func configure(title: String) {
        titleLabel.text = title
    }
}

// MARK: - Actions

extension HeaderCollectionViewCell {
    @objc
    private func seeAllAction() {
        onSeeAll?()
    }
}

// MARK: - Constants

private extension HeaderCollectionViewCell {
    enum Constants {
        static let titleLabelLeftOffset = 3
    }
}
