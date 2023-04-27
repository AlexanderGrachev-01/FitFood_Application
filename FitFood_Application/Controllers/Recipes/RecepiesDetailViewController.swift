//
//  RecepiesDetailViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 27.04.2023.
//

import UIKit

final class RecepiesDetailViewController: FFBaseViewController {
    // MARK: - Properties
    
    // MARK: - Subviews
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Layout

private extension RecepiesDetailViewController {
    func configureViews() {
        title = Asset.Strings.recipes
        navigationItem.largeTitleDisplayMode = .never
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = Asset.Colors.background
        collectionView.register(RecipeDetilsCollectionViewCell.self, forCellWithReuseIdentifier: RecipeDetilsCollectionViewCell.identifier)
        collectionView.register(CheckBoxCollectionViewCell.self, forCellWithReuseIdentifier: CheckBoxCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension RecepiesDetailViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension RecepiesDetailViewController: UICollectionViewDataSource {
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
        case .ingredients:
            return 6
        case .cookingSteps:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .info:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecipeDetilsCollectionViewCell.identifier,
                for: indexPath
            ) as? RecipeDetilsCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        case .ingredients:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CheckBoxCollectionViewCell.identifier,
                for: indexPath
            ) as? CheckBoxCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        case .cookingSteps:
            return UICollectionViewCell()
        }
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecepiesDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = CollectionSectionType(rawValue: indexPath.section) else {
            return CGSize()
        }
        
        switch section {
        case .info:            
            let widthPerItem = view.frame.width - Constants.firstSectionInset.left * 2
            return CGSize(width: widthPerItem, height: Constants.firstSectionCellsHeight)
        case .ingredients:
            let widthPerItem = view.frame.width - Constants.secondSectionInset.left * 2
            return CGSize(width: widthPerItem, height: Constants.secondSectionCellsHeight)
        case .cookingSteps:
            return CGSize()
        }
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = CollectionSectionType(rawValue: section) else {
            return UIEdgeInsets()
        }
        
        switch section {
        case .info:
            return Constants.firstSectionInset
        case .ingredients:
            return Constants.secondSectionInset
        case .cookingSteps:
            return Constants.thirdSectionInset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }
        
        switch section {
        case .info:
            return Constants.minimumInteritemSpacingForSection
        case .ingredients:
            return Constants.minimumInteritemSpacingForSection
        case .cookingSteps:
            return  Constants.minimumInteritemSpacingForSection
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = CollectionSectionType(rawValue: section) else {
            return CGFloat()
        }
        
        switch section {
        case .info:
            return Constants.minimumLineSpacingForSection
        case .ingredients:
            return Constants.minimumLineSpacingForSection
        case .cookingSteps:
            return Constants.minimumLineSpacingForSection
        }
    }
}

// MARK: - Constants

private extension RecepiesDetailViewController {
    enum Constants {
        static let firstSectionCellsHeight = 483.0
        static let secondSectionCellsHeight = 38.0
        static let firstSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        static let secondSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        static let thirdSectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        static let minimumInteritemSpacingForSection = 12.0
        static let minimumLineSpacingForSection = 12.0
    }
    
    enum CollectionSectionType: Int, CaseIterable {
        case info = 0
        case ingredients = 1
        case cookingSteps = 2
    }
}
