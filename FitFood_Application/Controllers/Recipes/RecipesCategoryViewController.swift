//
//  RecipesCategoryViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 05.06.2023.
//

import UIKit

final class RecipesCategoryViewController: FFBaseViewController {
    // MARK: - Properties

    var recipes: [FFRecipe] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Subviews

    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: - Layout

private extension RecipesCategoryViewController {
    func configureViews() {
        configureCollectionView()
        navigationItem.largeTitleDisplayMode = .never
    }

    func configureCollectionView() {
        collectionView.register(
            RecipeInfoCollectionViewCell.self,
            forCellWithReuseIdentifier: RecipeInfoCollectionViewCell.identifier
        )
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

extension RecipesCategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecepiesDetailViewController()

        vc.recipe = recipes[indexPath.item]

        navigationController?.pushViewController(vc, animated: true)
        return
    }
}

// MARK: - UICollectionViewDataSource

extension RecipesCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecipeInfoCollectionViewCell.identifier,
            for: indexPath
        ) as? RecipeInfoCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(recipe: recipes[indexPath.item ])

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecipesCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = view.frame.width / 2 - Constants.sectionInset.left - Constants.minimumInteritemSpacingForSection / 2
        return CGSize(width: widthPerItem, height: Constants.sectionCellsHeight)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Constants.sectionInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.minimumInteritemSpacingForSection
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.minimumLineSpacingForSection
    }
}

// MARK: - Constants

private extension RecipesCategoryViewController {
    enum Constants {
        static let sectionCellsHeight = 228.0
        static let sectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        static let minimumInteritemSpacingForSection = 12.0
        static let minimumLineSpacingForSection = 12.0
    }
}

