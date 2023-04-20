//
//  FFAddingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFAddingViewController: FFBaseViewController {
    
    // MARK: - Properties
    
    private let segmentsArray = [Asset.Strings.recent, Asset.Strings.favorites]
    
    // MARK: - Subviews
    
    private lazy var searchController = UISearchController()
    private lazy var segmentedControl = UISegmentedControl(items: segmentsArray)
    private lazy var addDishButton = UIButton()
    private lazy var tableView = UITableView(frame: .zero)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Layout
    
private extension FFAddingViewController {
    func configureViews() {
        title = Asset.Strings.lunch
        view.backgroundColor = Asset.Colors.secondaryBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        configureSegmentedControl()
        configureAddDishButton()
        configureTableView()
    }
    
    func configureSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(Constants.segmentedControlOffset)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-Constants.segmentedControlOffset)
            $0.height.equalTo(Constants.segmentedControlHeight)
        }
    }
    
    func configureAddDishButton() {
        addDishButton.setImage(
            Asset.Images.plus.withTintColor(Asset.Colors.green),
            for: .normal
        )
        addDishButton.setImage(
            Asset.Images.plus.withTintColor(Asset.Colors.lightGreen),
            for: .highlighted
        )
        addDishButton.setTitle("Добавить свое блюдо", for: .normal)
        addDishButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        addDishButton.setTitleColor(Asset.Colors.green, for: .normal)
        addDishButton.setTitleColor(Asset.Colors.lightGreen, for: .highlighted)
        view.addSubview(addDishButton)
        addDishButton.snp.makeConstraints {
            $0.height.equalTo(Constants.addDishButtonHeight)
            $0.width.equalTo(Constants.addDishButtonWidth)
            $0.top.equalTo(segmentedControl.snp.bottom).offset(Constants.addDishButtonTopOffset)
            $0.left.equalToSuperview().offset(Constants.addDishButtonSideOffset)
        }
    }
    
    func configureTableView() {
        tableView.backgroundColor = Asset.Colors.secondaryBackground
        tableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(addDishButton.snp.bottom).offset(Constants.tableViewTopOffset)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(Constants.tableViewBottomOffset)
        }
    }
}

extension FFAddingViewController {
    
}

// MARK: - UITableViewDelegate

extension FFAddingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FFAddingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductInfoTableViewCell.identifier
        ) as? ProductInfoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.onChangeFavourite = { isFavourite in
            print(isFavourite)
        }
        
        return cell
    }
    
    
}


// MARK: - UISearchResultsUpdating

extension FFAddingViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //        guard let text = searchController.searchBar.text else {
        //            return
        //        }

    }
}

// MARK: - UISearchResultsUpdating

extension FFAddingViewController: UISearchControllerDelegate {
    
}

private extension FFAddingViewController {
    enum Constants {
        static let segmentedControlOffset = 16
        static let segmentedControlHeight = 32
        
        static let addDishButtonWidth = 207
        static let addDishButtonSideOffset = 20
        static let addDishButtonTopOffset = 24
        static let addDishButtonHeight = 24
        
        static let tableViewTopOffset = 12
        static let tableViewBottomOffset = 24
        
        static let tableViewCellHeight = 72.0
    }
}
