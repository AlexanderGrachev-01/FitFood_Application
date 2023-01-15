//
//  FFDailyViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit
import SnapKit

final class FFDailyViewController: UIViewController {
    
    // MARK: - Constants
    
    private let calendarViewHeight: CGFloat = 102
    
    private let calendarModel = FFCalendarModel()
    private lazy var centerDate = Date()
    
    // MARK: - Subviews
    
    private lazy var calendarView: FFCalendarCollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(FFCalendarCollectionView())
    
    private let tableView: FFDailyTableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(FFDailyTableView())

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
        title = "Daily"
        view.backgroundColor = .systemBackground
        
        configureCalendarView()
        configureTableView()
    }
    
    private func configureCalendarView() {
        updateData(day: 0)
        calendarView.calendarDelegate = self
        
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(calendarViewHeight)
        }
    }
    
    private func configureTableView() {
        tableView.addTopBorder(with: .lightGray, height: 0.5)
        tableView.backgroundColor = .secondarySystemBackground
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.right.left.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
}

