//
//  FFDailyViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFDailyViewController: FFBaseViewController {
    // MARK: - Properties
    
    private let calendarModel = FFCalendarModel()
    private lazy var centerDate = Date()
    
    // MARK: - Subviews
    
    private lazy var calendarView = FFCalendarCollectionView()
    private lazy var collectionBottomSeparator = UIView()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calendarView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Layout
    
private extension FFDailyViewController {
    func configureViews() {
        title = Asset.Strings.daily
        
        configureCalendarView()
        configureCollectionBottomSeparator()
    }
    
    func configureCalendarView() {
        updateData(day: 0)
        calendarView.calendarDelegate = self
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(Constants.calendarViewHeight)
        }
    }
    
    func configureCollectionBottomSeparator() {
        collectionBottomSeparator.backgroundColor = Asset.Colors.separator
        collectionBottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionBottomSeparator)
        
        collectionBottomSeparator.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    func configureCollectionView() {
        
    }
}
    
// MARK: - Actions
    
extension FFDailyViewController {
    // Calendar view
    private func updateData(day offset: Int) {
        centerDate = centerDate.getDateWithOffset(with: offset)
        let daysArr = calendarModel.getWeeksForCalendar(date: centerDate)
        
        calendarView.setDaysArr(daysArr)
        calendarView.reloadData()
        calendarView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
    }
}

// MARK: - UICollectionViewDelegate

extension FFDailyViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegate

extension FFDailyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension FFDailyViewController: UICollectionViewDelegateFlowLayout {
    
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

// MARK: - Constants

private extension FFDailyViewController {
    enum Constants {
        static let calendarViewHeight: CGFloat = 102
    }
}

