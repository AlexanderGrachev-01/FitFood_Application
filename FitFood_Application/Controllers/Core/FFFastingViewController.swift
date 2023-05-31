//
//  FFFastingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFFastingViewController: FFBaseViewController {
    // MARK: - Properties

    var isActive = true

    // MARK: - Subviews

    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Layout

private extension FFFastingViewController {
    private func configureViews() {
        title = Asset.Strings.fasting
        navigationController?.navigationBar.addBottomBorder(
            with: Asset.Colors.separator,
            height: 0.5
        )
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(
            FastingConfigCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingConfigCollectionViewCell.identifier
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

// MARK: - UICollectionViewDelegate

extension FFFastingViewController: UICollectionViewDelegate {
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
            return 0 // isActive ? 1 : 0
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
            return UICollectionViewCell()
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
            return CGSize()
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
            return Constants.CollectionView.sectionInset
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
        }
    }

    enum CollectionSectionType: Int, CaseIterable {
        case configure = 0
        case main = 1
        case statistic = 2
        case info = 3
    }
}
