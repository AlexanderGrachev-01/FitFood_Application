//
//  FFDailyViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFDailyViewController: FFBaseViewController {
    
    // MARK: - Constants
    
    private let calendarViewHeight: CGFloat = 102
    
    private let calendarModel = FFCalendarModel()
    private lazy var centerDate = Date()
    
    // MARK: - Subviews
    
    private lazy var calendarView = FFCalendarCollectionView()
    private lazy var collectionBottomSeparator = UIView()

    // MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calendarView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = Asset.Strings.daily
        
        configureCalendarView()
        configureCollectionBottomSeparator()
    }
    
    private func configureCalendarView() {
        updateData(day: 0)
        calendarView.calendarDelegate = self
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(calendarViewHeight)
        }
    }
    
    private func configureCollectionBottomSeparator() {
        collectionBottomSeparator.backgroundColor = Asset.Colors.separator
        collectionBottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionBottomSeparator)
        
        collectionBottomSeparator.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    // MARK: - Private Function
    
    private func updateData(day offset: Int) {
        centerDate = centerDate.getDateWithOffset(with: offset)
        let daysArr = calendarModel.getWeeksForCalendar(date: centerDate)
        
        calendarView.setDaysArr(daysArr)
        calendarView.reloadData()
        calendarView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
    }
}

// MARK: - CalendarDelegate

extension FFDailyViewController: CalendarDelegate {
    func maxLeftOffset() {
        updateData(day: -7)
    }
    
    func maxRightOffset() {
        updateData(day: 7)
    }
    
    func cellWasSelected(date: FFDateModel) {
        print("Date: \(date.dateString)")
    }
}

