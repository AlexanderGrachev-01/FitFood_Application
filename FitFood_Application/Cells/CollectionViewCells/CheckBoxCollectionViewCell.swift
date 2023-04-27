//
//  CheckBoxCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.04.2023.
//

import UIKit

final class CheckBoxCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "CheckBoxCollectionViewCell"
    
    // MARK: - Properties
    
    private var isDone = false {
        didSet {
            if isDone {
                checkButton.setImage(
                    Asset.Images.checkRadioSelected,
                    for: .normal
                )
            } else {
                checkButton.setImage(
                    Asset.Images.checkRadio,
                    for: .normal
                )
            }
        }
    }
    
    // MARK: - Handlers
    
    var onChangeState: ((_ isDone: Bool) -> Void)?
    
    // MARK: - Subviews
    
    private lazy var checkButton = UIButton()
    private lazy var nameLabel = UILabel()
    
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

private extension CheckBoxCollectionViewCell {
    func configureViews() {
        configureCheckButton()
        configureNameLabel()
    }
    
    func configureCheckButton() {
        checkButton.setImage(Asset.Images.checkRadio, for: .normal)
        checkButton.setImage(Asset.Images.checkRadioSelected, for: .highlighted)
        checkButton.contentMode = .scaleAspectFit
        checkButton.addTarget(self, action: #selector(doneAction), for: .touchDown)
        contentView.addSubview(checkButton)
        checkButton.snp.makeConstraints {
            $0.height.width.equalTo(Constants.checkButtonSize)
            $0.top.left.equalToSuperview()
        }
    }
    
    func configureNameLabel() {
        nameLabel.text = "Vegetables"
        nameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        nameLabel.textColor = Asset.Colors.label
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(checkButton.snp.right).offset(Constants.nameLabelOffset)
        }
    }
}

// MARK: - Actions

private extension CheckBoxCollectionViewCell {
    @objc
    private func doneAction() {
        isDone = !isDone
        onChangeState?(isDone)
    }
}

// MARK: - Constants

private extension CheckBoxCollectionViewCell {
    enum Constants {
        static let checkButtonSize = 38
        static let nameLabelOffset = 12
    }
}
