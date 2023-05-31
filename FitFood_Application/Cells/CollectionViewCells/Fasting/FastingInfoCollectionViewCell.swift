//
//  FastingInfoCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 01.06.2023.
//

import UIKit

final class FastingInfoCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingInfoCollectionViewCell"

    // MARK: - Properties

    private let cellImages = [Asset.Images.weight, Asset.Images.intervals, Asset.Images.health, Asset.Images.drinks, Asset.Images.intervals]

    private let cellTexts = [Asset.Strings.loseWeight, Asset.Strings.intervals, Asset.Strings.health, Asset.Strings.drinks, Asset.Strings.activity]

    // MARK: - Handlers

    var onSelectItem: ((_ index: Int) -> Void)?

    // MARK: - Subviews

    private var title = UILabel()
    private var collectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        return collectionView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension FastingInfoCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitle()
        configureCollectionView()
    }

    func configureTitle() {
        title.text = Asset.Strings.aboutIntermittentFasting
        title.textColor = Asset.Colors.label
        title.font = .systemFont(ofSize: 14, weight: .semibold)
        contentView.addSubview(title)
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.Title.left)
        }
    }

    func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            FastingInfoCardCollectionViewCell.self,
            forCellWithReuseIdentifier: FastingInfoCardCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(Constants.CollectionView.top)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FastingInfoCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectItem?(indexPath.item)
    }
}

// MARK: - UICollectionViewDataSource

extension FastingInfoCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FastingInfoCardCollectionViewCell.identifier,
            for: indexPath
        ) as? FastingInfoCardCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(image: cellImages[indexPath.item], text: cellTexts[indexPath.item])

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension FastingInfoCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: Constants.CollectionView.cellWidth,
            height: collectionView.frame.height
        )
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Constants.CollectionView.insetForSection
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.CollectionView.minimumInteritemSpacing
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.CollectionView.minimumLineSpacingForSection
    }
}

// MARK: - Constants

private extension FastingInfoCollectionViewCell {
    enum Constants {
        enum Title {
            static let left = 8
        }
        enum CollectionView {
            static let top = 8
            static let cellWidth = 100.0
            static let insetForSection =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            static let minimumInteritemSpacing = 0.0
            static let minimumLineSpacingForSection = 10.0
        }
    }
}
