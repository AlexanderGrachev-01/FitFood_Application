//
//  FFUserInfoTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

class FFUserInfoTableViewCell: UITableViewCell {
    
    // MARK: - Identifier

    public static let identifier = "FFUserInfoTableViewCell"
    
    // MARK: - Constant
    
    private let rightImageOffset = 24
    private let imageWidth = 40
    private let leftLabelOffset = 24
    
    // MARK: - Subviews
    
    private let nameLabel = UILabel()
    private let genderLabel = UILabel()
    private let userIcon = UIImageView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        backgroundColor = Asset.Colors.secondaryBackground
        configureUserIcon()
        configureNameLabel()
        configureGenderLabel()
    }
    
    private func configureUserIcon() {
        userIcon.image = Asset.Images.iconPerson
        userIcon.image?.withTintColor(.label)
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userIcon)
        
        userIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-4)
            $0.height.width.equalTo(imageWidth)
            $0.right.equalToSuperview().offset(-rightImageOffset)
        }
    }
    
    private func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.centerY).offset(-2)
            $0.left.equalToSuperview().offset(leftLabelOffset)
        }
    }
    
    private func configureGenderLabel() {
        genderLabel.font = .systemFont(ofSize: 14)
        genderLabel.textColor = .secondaryLabel
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(genderLabel)
        
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.centerY).offset(2)
            $0.left.equalToSuperview().offset(leftLabelOffset)
        }
    }
    
    // MARK: - Public
    
    public func configure(fullName: String, gender: FFGender) {
        nameLabel.text = fullName
        genderLabel.text = gender.rawValue
    }
}
