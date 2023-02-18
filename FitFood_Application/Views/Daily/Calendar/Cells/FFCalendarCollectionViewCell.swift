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
    
    private let dayOfWeekLabelTopOffset: CGFloat = 7
    private let dateNumberLabelBottomOffset: CGFloat = 7
    
    private lazy var isToday = false
    
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
                self.backgroundColor = Asset.Colors.selectedDate
                self.dateNumberLabel.textColor = .label
            } else {
                self.backgroundColor = .clear
                if !isToday { self.dateNumberLabel.textColor = .secondaryLabel }
            }
        }
    }
    
    // MARK: - Public Functions
    
    public func configure(model: FFDateModel) {
        dayOfWeekLabel.text = model.dayOfWeek
        dateNumberLabel.text = model.numberOfDay
        if model.dateString == Date().getDateFormatddMMyyyy() {
            isToday = true
        }
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
            $0.bottom.equalToSuperview().offset(-dateNumberLabelBottomOffset)
            $0.centerX.equalToSuperview()
        }
    }
}

extension FFCalendarCollectionViewCell {
    
}
