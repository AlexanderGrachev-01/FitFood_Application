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
        configureCollectionView()
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
        collectionView.register(FFDailyStatCollectionViewCell.self,
                                forCellWithReuseIdentifier: FFDailyStatCollectionViewCell.identifier)
        collectionView.register(FFDailyWaterStatCollectionViewCell.self,
                                forCellWithReuseIdentifier: FFDailyWaterStatCollectionViewCell.identifier)
        collectionView.register(FFDailyStepsStatCollectionViewCell.self,
                                forCellWithReuseIdentifier: FFDailyStepsStatCollectionViewCell.identifier)
        collectionView.register(FFDailyFastingTimerCollectionViewCell.self,
                                forCellWithReuseIdentifier: FFDailyFastingTimerCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(collectionBottomSeparator.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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

// MARK: - UICollectionViewDataSource

extension FFDailyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FFDailyStatCollectionViewCell.identifier,
                for: indexPath
            ) as? FFDailyStatCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FFDailyWaterStatCollectionViewCell.identifier,
                for: indexPath
            ) as? FFDailyWaterStatCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FFDailyStepsStatCollectionViewCell.identifier,
                for: indexPath
            ) as? FFDailyStepsStatCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FFDailyFastingTimerCollectionViewCell.identifier,
                for: indexPath
            ) as? FFDailyFastingTimerCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FFDailyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            let widthPerItem = view.frame.width - 36
            return CGSize(width: widthPerItem, height: Constants.statCellHeight)
        case 1:
            let widthPerItem = view.frame.width / 2 - 27
            return CGSize(width: widthPerItem, height: Constants.waterStatCellHeight)
        case 2:
            let widthPerItem = view.frame.width / 2 - 27
            return CGSize(width: widthPerItem, height: Constants.stepsStatCellHeight)
        case 3:
            let widthPerItem = view.frame.width - 36
            return CGSize(width: widthPerItem, height: Constants.fastingTimerCellHeight)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        Constants.sectionInsets
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        Constants.sectionInsets.left
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        Constants.sectionInsets.top
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

// MARK: - Constants

private extension FFDailyViewController {
    enum Constants {
        static let calendarViewHeight: CGFloat = 102
        static let sectionInsets = UIEdgeInsets(top: 24, left: 18, bottom: 24, right: 18)
        static let statCellHeight: CGFloat = 404
        static let waterStatCellHeight: CGFloat = 275
        static let stepsStatCellHeight: CGFloat = 275
        static let fastingTimerCellHeight: CGFloat = 147
    }
}

