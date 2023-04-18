//
//  FFRecipesViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFRecipesViewController: FFBaseViewController {
    // MARK: - Properties
    
    private var sections = ["Popular menus", "Сategories", "Recently"]
    
    // MARK: - Subviews
    
    private lazy var separator = UIView()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Layout

private extension FFRecipesViewController {
    func configureViews() {
        title = Asset.Strings.recipes
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
    
    func configureCollectionView() {
        collectionView.register(PopularMenusHeaderCell.self, forCellWithReuseIdentifier: PopularMenusHeaderCell.identifier)
        collectionView.register(DishInfoCollectionViewCell.self, forCellWithReuseIdentifier: DishInfoCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FFRecipesViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension FFRecipesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 0
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PopularMenusHeaderCell.identifier,
                    for: indexPath
                ) as? PopularMenusHeaderCell else {
                    return UICollectionViewCell()
                }
                
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DishInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? DishInfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        case 1:
            return UICollectionViewCell()
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DishInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? DishInfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FFRecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let widthPerItem = view.frame.width - Constants.firstSectionInset.left * 2
                return CGSize(width: widthPerItem, height: Constants.firstSectionHeaderHeight)
            }
            
            let widthPerItem = view.frame.width / 2 - Constants.firstSectionInset.left - Constants.minimumInteritemSpacingForFirstSection / 2
            return CGSize(width: widthPerItem, height: Constants.firstSectionCellsHeight)
        case 1:
            return CGSize()
        case 2:
            let widthPerItem = view.frame.width / 2 - Constants.firstSectionInset.left - Constants.minimumInteritemSpacingForFirstSection / 2
            return CGSize(width: widthPerItem, height: Constants.firstSectionCellsHeight)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return Constants.firstSectionInset
        case 1:
            return UIEdgeInsets()
        case 2:
            return Constants.thirdSectionInset
        default:
            return UIEdgeInsets()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return Constants.minimumInteritemSpacingForFirstSection
        case 1:
            return CGFloat()
        case 2:
            return  Constants.minimumInteritemSpacingForFirstSection
        default:
            return CGFloat()
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return Constants.minimumLineSpacingForFirstSection
        case 1:
            return CGFloat()
        case 2:
            return Constants.minimumLineSpacingForFirstSection
        default:
            return CGFloat()
        }
    }
}

private extension FFRecipesViewController {
    enum Constants {
        static let separatorHeight = 0.5
        
        static let firstSectionHeaderHeight = 101.0
        static let firstSectionCellsHeight = 228.0
        static let firstSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        static let thirdSectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 24, right: 20)
        static let minimumInteritemSpacingForFirstSection = 12.0
        static let minimumLineSpacingForFirstSection = 12.0
    }
}
