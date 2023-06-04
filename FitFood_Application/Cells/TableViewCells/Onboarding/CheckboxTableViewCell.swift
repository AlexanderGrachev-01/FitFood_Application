//
//  CheckboxTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class CheckboxTableViewCell: UITableViewCell {
    // MARK: - Handlers

    var onTapped: (() -> Void)?
    
    // MARK: - Identifier

    static let identifier = "CheckboxTableViewCell"

    // MARK: - Subviews

    private var pickView = UIView()
    private var titleLabel = UILabel()
    private var checkboxImageView = UIImageView()

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

private extension CheckboxTableViewCell {
    func configureViews() {
        contentView.backgroundColor = Asset.Colors.secondaryBackground
        configurePickView()
        configureTitleLabel()
        configureCheckboxImageView()
    }

    func configurePickView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        pickView.addGestureRecognizer(tap)
        pickView.backgroundColor = Asset.Colors.paleGreen
        pickView.layer.cornerRadius = Constants.PickView.cornerRadius
        contentView.addSubview(pickView)
        pickView.snp.makeConstraints {
            $0.height.equalTo(Constants.PickView.height)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(Constants.PickView.top)
            $0.bottom.equalTo(Constants.PickView.bottom)
        }
    }
    
    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        pickView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(Constants.title.left)
        }
    }
    
    func configureCheckboxImageView() {
        checkboxImageView.image = Asset.Images.checkboxEmpty
        pickView.addSubview(checkboxImageView)
        checkboxImageView.snp.makeConstraints {
            $0.right.equalTo(Constants.checkbox.right)
            $0.height.width.equalTo(Constants.checkbox.height)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: - Public configure

extension CheckboxTableViewCell {
    func configure(title: String, isCheck: Bool) {
        titleLabel.text = title
        checkboxImageView.image = isCheck ? Asset.Images.checkboxFilled : Asset.Images.checkboxEmpty
    }
}

// MARK: - Actions

extension CheckboxTableViewCell {
    @objc
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        onTapped?()
    }
}

// MARK: - Constants

private extension CheckboxTableViewCell {
    enum Constants {
        enum PickView {
            static let cornerRadius = 16.0
            static let top = 8
            static let bottom = -8
            static let height = 51
        }
        enum title {
            static let left = 16
        }
        enum checkbox {
            static let height = 24
            static let right = -16
        }
    }
}

