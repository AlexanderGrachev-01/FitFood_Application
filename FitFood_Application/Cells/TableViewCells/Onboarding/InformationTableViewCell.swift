//
//  InformationTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class InformationTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "InformationTableViewCell"

    // MARK: - Subviews

    private var infoLabel = UILabel()

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

private extension InformationTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configureInfoLabel()
    }

    func configureInfoLabel() {
        infoLabel.font = .systemFont(ofSize: 14, weight: .regular)
        infoLabel.textColor = .gray
        infoLabel.numberOfLines = 0
        contentView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints {
            $0.left.right.equalTo(0)
            $0.top.equalTo(5)
            $0.bottom.equalTo(-5)
        }
    }
}

// MARK: - Public configure

extension InformationTableViewCell {
    func configure(info: String) {
        infoLabel.text = info
    }
}
