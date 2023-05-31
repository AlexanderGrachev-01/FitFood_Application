//
//  FastingStatCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 01.06.2023.
//

import UIKit

final class FastingStatCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingStatCollectionViewCell"

    // MARK: - Subviews

    private var title = UILabel()
    private var backView = UIView()

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

private extension FastingStatCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitle()
        configureBackView()
    }

    func configureTitle() {
        title.text = Asset.Strings.yourFasting
        title.textColor = Asset.Colors.label
        title.font = .systemFont(ofSize: 14, weight: .semibold)
        contentView.addSubview(title)
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.Title.left)
        }
    }

    func configureBackView() {
        backView.backgroundColor = Asset.Colors.secondaryBackground
        backView.layer.cornerRadius = Constants.BackView.cornerRadius
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(Constants.BackView.top)
            $0.left.right.bottom.equalToSuperview()
        }

    }
}

// MARK: - Constants

private extension FastingStatCollectionViewCell {
    enum Constants {
        enum Title {
            static let left = 8
        }
        enum BackView {
            static let cornerRadius = 10.0
            static let top = 8
        }
    }
}
