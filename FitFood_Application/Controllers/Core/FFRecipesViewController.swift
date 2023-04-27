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
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        collectionView.register(RecipeInfoCollectionViewCell.self, forCellWithReuseIdentifier: RecipeInfoCollectionViewCell.identifier)
        collectionView.register(RecipesCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: RecipesCategoriesCollectionViewCell.identifier)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(
            RecepiesDetailViewController(),
            animated: true
        )
    }
}

// MARK: - UICollectionViewDataSource

extension FFRecipesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = CollectionSectionType(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .popular:
            return 5
        case .categories:
            return 5
        case .recently:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .popular:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PopularMenusHeaderCell.identifier,
                    for: indexPath
                ) as? PopularMenusHeaderCell else {
                    return UICollectionViewCell()
                }
                
                cell.onSeeAll = {
                    print("See all")
                }
                
                cell.onChangeMeal = { meal in
                    print(meal)
                }
                
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecipeInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? RecipeInfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        case .categories:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HeaderCollectionViewCell.identifier,
                    for: indexPath
                ) as? HeaderCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(title: sections[indexPath.section])
                
                cell.onSeeAll = {
                    print("See all")
                }
                
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecipesCategoriesCollectionViewCell.identifier,
                for: indexPath
            ) as? RecipesCategoriesCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(image: Asset.Images.banana, title: "Fruits")
            
            return cell
        case  .recently:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HeaderCollectionViewCell.identifier,
                    for: indexPath
                ) as? HeaderCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(title: sections[indexPath.section])
                
                cell.onSeeAll = {
                    print("See all")
                }
                
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecipeInfoCollectionViewCell.identifier,
                for: indexPath
            ) as? RecipeInfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FFRecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return CGSize()
        }
        
        switch section {
        case .popular:
            if indexPath.row == 0 {
                let widthPerItem = view.frame.width - Constants.firstSectionInset.left * 2
                return CGSize(width: widthPerItem, height: Constants.firstSectionHeaderHeight)
            }
            
            let widthPerItem = view.frame.width / 2 - Constants.firstSectionInset.left - Constants.minimumInteritemSpacingForSection / 2
            return CGSize(width: widthPerItem, height: Constants.firstSectionCellsHeight)
        case .categories:
            if indexPath.row == 0 {
                let widthPerItem = view.frame.width - Constants.firstSectionInset.left * 2
                return CGSize(width: widthPerItem, height: Constants.sectionHeaderHeight)
            }
            
            let  widthPerItem = (view.frame.width - Constants.firstSectionInset.left * 2 - Constants.minimumInteritemSpacingForSection * 3) / 4
            return CGSize(width: widthPerItem, height: widthPerItem + 29)
        case .recently:
            if indexPath.row == 0 {
                let widthPerItem = view.frame.width - Constants.firstSectionInset.left * 2
                return CGSize(width: widthPerItem, height: Constants.sectionHeaderHeight)
            }
            
            let widthPerItem = view.frame.width / 2 - Constants.firstSectionInset.left - Constants.minimumInteritemSpacingForSection / 2
            return CGSize(width: widthPerItem, height: Constants.firstSectionCellsHeight)
        }
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = CollectionSectionType(rawValue: section) else {
            return UIEdgeInsets()
        }
        
        switch section {
        case .popular:
            return Constants.firstSectionInset
        case .categories:
            return Constants.secondSectionInset
        case .recently:
            return Constants.thirdSectionInset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }
        
        switch section {
        case .popular:
            return Constants.minimumInteritemSpacingForSection
        case .categories:
            return Constants.minimumInteritemSpacingForSection
        case .recently:
            return  Constants.minimumInteritemSpacingForSection
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }
        
        switch section {
        case .popular:
            return Constants.minimumLineSpacingForSection
        case .categories:
            return Constants.minimumLineSpacingForSection
        case .recently:
            return Constants.minimumLineSpacingForSection
        }
    }
}

// MARK: - Constants

private extension FFRecipesViewController {
    enum Constants {
        static let separatorHeight = 0.5
        static let sectionHeaderHeight = 36.0
        
        static let firstSectionHeaderHeight = 96.0
        static let firstSectionCellsHeight = 228.0
        static let firstSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        static let secondSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        static let thirdSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        static let minimumInteritemSpacingForSection = 12.0
        static let minimumLineSpacingForSection = 12.0
    }
    
    enum CollectionSectionType: Int, CaseIterable {
        case popular = 0
        case categories = 1
        case recently = 2
    }
}
