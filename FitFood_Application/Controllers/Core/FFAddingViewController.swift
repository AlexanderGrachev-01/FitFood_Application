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
    private var products: [FFProduct] = []
    
    // MARK: - Subviews
    
    private var searchController = UISearchController()
    private lazy var segmentedControl = UISegmentedControl(items: segmentsArray)
    private var addDishButton = UIButton()
    private var tableView = UITableView(frame: .zero)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        NetworkingClient.request(endpoint: Endpoints.getProducts) { [weak self] res, error in
            guard let self, let res else {
                print("error")
                return
            }

            self.products = res
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
        addDishButton.setTitle(Asset.Strings.addYourDish, for: .normal)
        addDishButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        addDishButton.titleLabel?.textAlignment = .left
        addDishButton.setTitleColor(Asset.Colors.green, for: .normal)
        addDishButton.setTitleColor(Asset.Colors.lightGreen, for: .highlighted)
        addDishButton.addTarget(self, action: #selector(addDishAction), for: .touchUpInside)
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
        tableView.register(
            ProductInfoTableViewCell.self,
            forCellReuseIdentifier: ProductInfoTableViewCell.identifier
        )
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

// MARK: - Actions

extension FFAddingViewController {
    @objc
    private func addDishAction() {
        navigationController?.pushViewController(
            ProductCreatingViewController(),
            animated: true
        )
    }
}

// MARK: - UITableViewDelegate

extension FFAddingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc =  ProductAddingViewController()

        vc.product = products[indexPath.item]

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FFAddingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
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

        cell.configure(product: products[indexPath.item])
        
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
        
        static let addDishButtonWidth = 166
        static let addDishButtonSideOffset = 20
        static let addDishButtonTopOffset = 24
        static let addDishButtonHeight = 24
        
        static let tableViewTopOffset = 12
        static let tableViewBottomOffset = 24
        
        static let tableViewCellHeight = 72.0
    }
}
