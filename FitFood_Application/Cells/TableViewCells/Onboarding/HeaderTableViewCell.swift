//
//  HeaderTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class HeaderTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "HeaderTableViewCell"

    // MARK: - Subviews

    private var titleLabel = UILabel()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension HeaderTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureTitleLabel()
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.right.equalTo(0)
            $0.top.equalTo(15)
            $0.bottom.equalTo(-5)
        }
    }
}

// MARK: - Public configure

extension HeaderTableViewCell {
    func configure(title: String) {
        titleLabel.text = title
    }
}
