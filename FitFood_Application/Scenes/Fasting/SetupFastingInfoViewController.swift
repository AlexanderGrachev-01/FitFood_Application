//
//  SetupFastingInfoViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class SetupFastingInfoViewController: UIViewController {
    // MARK: - Properties

    private var fastingType: FastingType = .first

    // MARK: - Subviews

    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: - Layout

private extension SetupFastingInfoViewController {
    private func configureViews() {
        title = Asset.Strings.fasting
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = Asset.Colors.secondaryBackground
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.register(
            FastingSetupInfoCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingSetupInfoCollectionViewCell.identifier
        )
        collectionView.register(
            WarningCollectionViewCell.self,
            forCellWithReuseIdentifier: WarningCollectionViewCell.identifier
        )
        collectionView.register(
            ButtonCollectionViewCell.self,
            forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: Public configure

extension SetupFastingInfoViewController {
    func setFastingType(fastingType: FastingType) {
        self.fastingType = fastingType
        collectionView.reloadData()
    }
}

// MARK: - Utils

extension SetupFastingInfoViewController {
    private func setFastingType() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(fastingType), forKey: "FastingType")
        navigationController?.popToRootViewController(animated: false)
    }
}

// MARK: - UICollectionViewDelegate

extension SetupFastingInfoViewController: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDataSource

extension SetupFastingInfoViewController: UICollectionViewDataSource {
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
        case .warning:
            return 1
        case .start:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch section {
        case .info:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FastingSetupInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? FastingSetupInfoCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(fastingType: fastingType)
            
            return cell
        case .warning:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WarningCollectionViewCell.identifier,
                for: indexPath
            ) as? WarningCollectionViewCell else {
                return UICollectionViewCell()
            }

            return cell
        case .start:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ButtonCollectionViewCell.identifier,
                for: indexPath
            ) as? ButtonCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(buttonTitle: Asset.Strings.startFasting)

            cell.onTapped = { [weak self] in
                self?.setFastingType()
            }
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SetupFastingInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return CGSize()
        }

        switch section {
        case .info:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.infoCellHeight
            )
        case .warning:
            let widthPerItem = view.frame.width - Constants.CollectionView.sectionInset.left - Constants.CollectionView.sectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.warningCellHeight
            )
        case .start:
            let widthPerItem = view.frame.width - Constants.CollectionView.lastSectionInset.left - Constants.CollectionView.lastSectionInset.right
            return CGSize(
                width: widthPerItem,
                height: Constants.CollectionView.startCellHeight
            )
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = CollectionSectionType(rawValue: section) else {
            return UIEdgeInsets()
        }

        switch section {
        case .info:
            return Constants.CollectionView.sectionInset
        case .warning:
            return Constants.CollectionView.sectionInset
        case .start:
            return Constants.CollectionView.lastSectionInset
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }

        switch section {
        case .info:
            return Constants.CollectionView.minimumLineSpacingForSection
        case .warning:
            return Constants.CollectionView.minimumLineSpacingForSection
        case .start:
            return Constants.CollectionView.minimumLineSpacingForSection
        }
    }
}

// MARK: - Constants

private extension SetupFastingInfoViewController {
    enum Constants {
        enum CollectionView {
            static let infoCellHeight = 120.0
            static let warningCellHeight = 247.0
            static let startCellHeight = 44.0
            static let minimumLineSpacingForSection = 16.0
            static let sectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
            static let lastSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        }
        static let separatorHeight = 0.5
    }

    enum CollectionSectionType: Int, CaseIterable {
        case info = 0
        case warning = 1
        case start = 2
    }
}
