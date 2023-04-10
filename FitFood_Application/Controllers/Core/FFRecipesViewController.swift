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
        navigationController?.navigationBar.addBottomBorder(
            with: Asset.Colors.separator,
            height: 0.5
        )
        configureCollectionView()
    }
    
    func configureCollectionView() {
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
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FFRecipesViewController: UICollectionViewDelegateFlowLayout {
    
}
