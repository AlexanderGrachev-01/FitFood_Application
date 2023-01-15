//
//  FFCalendarCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 15.01.2023.
//

import UIKit
import SnapKit

final class FFCalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "FFCalendarCollectionViewCell"
    
    // MARK: - Constants
    
    private let dayOfWeekLabelTopOffset: CGFloat = 8
    private let dateNumberLabelTopOffset: CGFloat = 3
    private let dateNumberLabelBottomOffset: CGFloat = 9
    
    // MARK: - Subviews
    
    private let dayOfWeekLabel: UILabel = {
        $0.text = "---"
        $0.textColor = .label
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let dateNumberLabel: UILabel = {
        $0.text = "--"
        $0.textColor = .secondaryLabel
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 22)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.backgroundColor = .secondarySystemBackground
                self.dateNumberLabel.textColor = .label
            } else {
                self.backgroundColor = .clear
                self.dateNumberLabel.textColor = .secondaryLabel
            }
        }
    }
    
    // MARK: - Public Functions
    
    public func configure(model: FFDateModel) {
        dayOfWeekLabel.text = model.dayOfWeek
        dateNumberLabel.text = model.numberOfDay
    }
    
    // MARK: - Private Functions
    
    private func configureViews() {
        layer.cornerRadius = 10
        backgroundColor = .clear
        
        configureDayOfWeekLabel()
        configureDateNumberLabel()
    }
    
    private func configureDayOfWeekLabel() {
        addSubview(dayOfWeekLabel)
        
        dayOfWeekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(dayOfWeekLabelTopOffset)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureDateNumberLabel() {
        addSubview(dateNumberLabel)
        
        dateNumberLabel.snp.makeConstraints {
            $0.top.equalTo(dayOfWeekLabel.snp.bottom).offset(dateNumberLabelTopOffset)
            $0.bottom.equalToSuperview().offset(dateNumberLabelBottomOffset)
            $0.centerX.equalToSuperview()
        }
    }
}

extension FFCalendarCollectionViewCell {
    
}
