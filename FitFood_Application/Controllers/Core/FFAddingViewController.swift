//
//  FFAddingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFAddingViewController: BaseViewController {
    
    // MARK: - Constant
    
    private let segmentsArray = ["Recent", "Favorites"]
    private let segmentedControlOffset = 16
    private let segmentedControlHeight = 32
    
    // MARK: - Subviews
    
    private lazy var searchController = UISearchController()
    private lazy var segmentedControl = UISegmentedControl(items: segmentsArray)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        title = "Lunch"
        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        configureSegmentedControl()
    }
    
    private func configureSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(segmentedControlOffset)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-segmentedControlOffset)
            $0.height.equalTo(segmentedControlHeight)
        }
    }
}

// MARK: - UISearchResultsUpdating

extension FFAddingViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        segmentedControl.isHidden = true
        guard let text = searchController.searchBar.text else {
            return
        }
        
        
    }
}
