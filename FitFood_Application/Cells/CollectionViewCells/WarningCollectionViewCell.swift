//
//  WarningCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class WarningCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "WarningCollectionViewCell"

    // MARK: - Subviews

    private var tableView = UITableView(frame: .zero)

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

private extension WarningCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.orange.withAlphaComponent(0.05)
        contentView.layer.cornerRadius = Constants.cornerRadius
    }
}

// MARK: - Constants

extension WarningCollectionViewCell {

}

// MARK: - Constants

private extension WarningCollectionViewCell {
    enum Constants {
        enum TableView {
            
        }
        static let cornerRadius = 20.0
    }
}
