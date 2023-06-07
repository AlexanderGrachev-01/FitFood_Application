//
//  FFFastingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFFastingViewController: FFBaseViewController {
    // MARK: - Properties

    var isActive = false
    var fastingType: FastingType?

    // MARK: - Subviews

    private var separator = UIView()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getFastingType()
    }
}

// MARK: - Layout

private extension FFFastingViewController {
    private func configureViews() {
        title = Asset.Strings.fasting
        configureCollectionView()
        configureSeparator()
    }

    func configureSeparator() {
        separator.backgroundColor = Asset.Colors.separator
        view.addSubview(separator)
        separator.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(Constants.separatorHeight)
        }
    }

    private func configureCollectionView() {
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(
            FastingConfigCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingConfigCollectionViewCell.identifier
        )
        collectionView.register(
            FastingMainCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingMainCollectionViewCell.identifier
        )
        collectionView.register(
            FastingStatCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingStatCollectionViewCell.identifier
        )
        collectionView.register(
            FastingInfoCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingInfoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Utils

extension FFFastingViewController {
    func getFastingType() {
        guard let data = UserDefaults.standard.value(forKey: "FastingType") as? Data else {
            return
        }
        fastingType = try? PropertyListDecoder().decode(FastingType.self, from: data)
        if fastingType != nil {
            isActive = true
            collectionView.reloadData()
        } else {
            isActive = false
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FFFastingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return
        }

        switch section {
        case .configure:
            navigationController?.pushViewController(
                SetupFastingViewController(),
                animated: true
            )
            return
        case .main:
            navigationController?.pushViewController(
                SetupFastingViewController(),
                animated: true
            )
            return
        case .statistic:
            return
        case .info:
            return
        }
    }
}

// MARK: - UICollectionViewDataSource

extension FFFastingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CollectionSectionType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = CollectionSectionType(rawValue: section) else {
            return 0
        }

        switch section {
        case .configure:
            return isActive ? 0 : 1
        case .main:
            return isActive ? 1 : 0
        case .statistic:
            return isActive ? 1 : 0
        case .info:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch section {
        case .configure:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingConfigCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingConfigCollectionViewCell else {
                return UICollectionViewCell()
            }

            return cell
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingMainCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingMainCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(fastingType: fastingType)

            return cell
        case .statistic:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingStatCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingStatCollectionViewCell else {
                return UICollectionViewCell()
            }

            return cell
        case .info:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingInfoCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.onSelectItem = { index in
                print(index)
            }

            return cell
        }
    }


}

// MARK: - UICollectionViewDelegateFlowLayout

extension FFFastingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return CGSize()
        }

        switch section {
        case .configure:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.configureCellHeight
            )
        case .main:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.mainCellHeight
            )
        case .statistic:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.statisticCellHeight
            )
        case .info:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.infoCellHeight
            )
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = CollectionSectionType(rawValue: section) else {
            return UIEdgeInsets()
        }

        switch section {
        case .configure:
            return isActive ? UIEdgeInsets() : Constants.CollectionView.sectionInset
        case .main:
            return isActive ? Constants.CollectionView.sectionInset : UIEdgeInsets()
        case .statistic:
            return isActive ? Constants.CollectionView.sectionInset : UIEdgeInsets()
        case .info:
            return Constants.CollectionView.lastSectionInset
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }
        
        switch section {
        case .configure:
            return isActive ? CGFloat() : Constants.CollectionView.minimumInteritemSpacing
        case .main:
            return isActive ? Constants.CollectionView.minimumInteritemSpacing : CGFloat()
        case .statistic:
            return isActive ? Constants.CollectionView.minimumInteritemSpacing : CGFloat()
        case .info:
            return Constants.CollectionView.minimumInteritemSpacing
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }

        switch section {
        case .configure:
            return isActive ? CGFloat() : Constants.CollectionView.minimumLineSpacingForSection
        case .main:
            return isActive ? Constants.CollectionView.minimumLineSpacingForSection : CGFloat()
        case .statistic:
            return isActive ? Constants.CollectionView.minimumLineSpacingForSection : CGFloat()
        case .info:
            return Constants.CollectionView.minimumLineSpacingForSection
        }
    }
}

// MARK: - Constants

private extension FFFastingViewController {
    enum Constants {
        enum CollectionView {
            static let configureCellHeight = 188.0
            static let mainCellHeight = 391.0
            static let statisticCellHeight = 138.0
            static let infoCellHeight = 214.0
            static let minimumInteritemSpacing = 0.0
            static let minimumLineSpacingForSection = 24.0
            static let sectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
            static let lastSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        }
        static let separatorHeight = 0.5
    }

    enum CollectionSectionType: Int, CaseIterable {
        case configure = 0
        case main = 1
        case statistic = 2
        case info = 3
    }
}
