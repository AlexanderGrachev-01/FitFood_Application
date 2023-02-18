//
//  FFCalendarCollectionView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 15.01.2023.
//

import UIKit

protocol CalendarDelegate: AnyObject {
    func maxLeftOffset()
    func maxRightOffset()
    func cellWasSelected(date: FFDateModel)
}

final class FFCalendarCollectionView: UICollectionView {
    
    // MARK: - Constants
    
    private let calendarCellHeight: CGFloat = 70
    
    private lazy var daysArr = [FFDateModel]()
    weak var calendarDelegate: CalendarDelegate?
    private let collectionLayout = UICollectionViewFlowLayout()
    
    // MARK: - Init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        configureLayout()
        configureCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    public func setDaysArr(_ array: [FFDateModel]) {
        daysArr = array
    }
    
    // MARK: - Private Functions
    
    private func configureLayout() {
        collectionLayout.minimumLineSpacing = 16
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 19, right: 16)
    }
    
    private func configureCollection() {
        register(FFCalendarCollectionViewCell.self, forCellWithReuseIdentifier: FFCalendarCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        
        backgroundColor = Asset.Colors.secondaryBackground
        bounces = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - DataSource

extension FFCalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        daysArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FFCalendarCollectionViewCell.identifier,
            for: indexPath
        ) as? FFCalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: daysArr[indexPath.row])
        if daysArr[indexPath.row].dateString == Date().getDateFormatddMMyyyy() {
            collectionView.selectItem(at: indexPath,
                                      animated: false,
                                      scrollPosition: [])
        }
        return cell
    }
    
    
}

// MARK: - Delegate

extension FFCalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        calendarDelegate?.cellWasSelected(date: daysArr[indexPath.row])
    }
}

// MARK: - DelegateFlowLayout

extension FFCalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 32) / 7) - collectionLayout.minimumLineSpacing * 6 / 7
        let size = CGSize(width: width, height: calendarCellHeight)
        return size
    }
}

// MARK: - ScrollView

//extension FFCalendarCollectionView {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.x < self.frame.width / 3 {
//            calendarDelegate?.maxLeftOffset()
//        }
//
//        if scrollView.contentOffset.x >= self.frame.width * 2 {
//            calendarDelegate?.maxRightOffset()
//        }
//    }
//}

