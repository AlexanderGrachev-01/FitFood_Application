//
//  SetupFastingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class SetupFastingViewController: UIViewController {
    // MARK: - Subviews
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: - Layout

private extension SetupFastingViewController {
    private func configureViews() {
        title = Asset.Strings.fasting
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = Asset.Colors.secondaryBackground
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.register(
            LabelCollectionViewCell.self,
            forCellWithReuseIdentifier: LabelCollectionViewCell.identifier
        )
        collectionView.register(
            FastingVariantCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingVariantCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SetupFastingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }

        let vc = SetupFastingInfoViewController()

        switch indexPath.item {
        case 0:
            vc.setFastingType(fastingType: .first)
        case 1:
            vc.setFastingType(fastingType: .second)
        case 2:
            vc.setFastingType(fastingType: .third)
        case 3:
            vc.setFastingType(fastingType: .fourth)
        default:
            return
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension SetupFastingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CollectionSectionType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = CollectionSectionType(rawValue: section) else {
            return 0
        }

        switch section {
        case .info:
            return 1
        case .fastingVariants:
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch section {
        case .info:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LabelCollectionViewCell.identifier,
                for: indexPath
            ) as? LabelCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(text: Asset.Strings.choosePlanToStartFasting)

            return cell
        case .fastingVariants:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingVariantCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingVariantCollectionViewCell else {
                return UICollectionViewCell()
            }

            switch indexPath.item {
            case 0:
                cell.configure(fastingType: .first)
            case 1:
                cell.configure(fastingType: .second)
            case 2:
                cell.configure(fastingType: .third)
            case 3:
                cell.configure(fastingType: .fourth)
            default:
                break
            }

            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SetupFastingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return CGSize()
        }

        switch section {
        case .info:
            let widthPerItem = view.frame.width - Constants.CollectionView.infoSectionInset.left - Constants.CollectionView.infoSectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.infoCellHeight
            )
        case .fastingVariants:
            let widthPerItem = view.frame.width - Constants.CollectionView.fastingVariantsSectionInset.left - Constants.CollectionView.fastingVariantsSectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.fastingVariantsCellHeight
            )
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = CollectionSectionType(rawValue: section) else {
            return UIEdgeInsets()
        }

        switch section {
        case .info:
            return Constants.CollectionView.infoSectionInset
        case .fastingVariants:
            return Constants.CollectionView.fastingVariantsSectionInset
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }

        switch section {
        case .info:
            return Constants.CollectionView.minimumLineSpacingForSection
        case .fastingVariants:
            return Constants.CollectionView.minimumLineSpacingForSection
        }
    }
}

// MARK: - Constants

private extension SetupFastingViewController {
    enum Constants {
        enum CollectionView {
            static let infoCellHeight = 17.0
            static let fastingVariantsCellHeight = 126.0
            static let minimumLineSpacingForSection = 16.0
            static let infoSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
            static let fastingVariantsSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        }
        static let separatorHeight = 0.5
    }

    enum CollectionSectionType: Int, CaseIterable {
        case info = 0
        case fastingVariants = 1
    }
}

