//
//  FFSettingsTableViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit

class FFSettingsTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    public static let identifier = "FFSettingsTableViewCell"
    
    // MARK: - Constant
    
    private let imageWidth = 24
    private let offset = 16
    
    // MARK: - Subviews
    
    private let label = UILabel()
    private let rightImage = UIImageView()
    private let leftImage = UIImageView()
    
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
        configureLeftIcon()
        configureRightIcon()
        configureLabel()
    }
    
    private func configureRightIcon() {
        rightImage.image = Asset.Images.iconChevronRightGrey
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightImage)
        
        rightImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-offset)
            $0.width.height.equalTo(imageWidth)
        }
    }
    
    private func configureLeftIcon() {
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftImage)
        
        leftImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(offset)
            $0.width.height.equalTo(imageWidth)
        }
    }
    
    private func configureLabel() {
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(leftImage.snp.right).offset(offset)
        }
    }
    
    // MARK: - Public
    
    public func configure(text: String, imageName: String) {
        label.text = text
        leftImage.image = UIImage(named: imageName)
    }
}
