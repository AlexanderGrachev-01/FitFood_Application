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
    private var filteredProducts: [FFProduct] = []
    private var mealType: MealType = .breakfast
    private var isSearching = false
    
    // MARK: - Subviews
    
    private var searchController = UISearchController()
    private lazy var segmentedControl = UISegmentedControl(items: segmentsArray)
    private var addDishButton = UIButton()
    private var tableView = UITableView(frame: .zero)
    private var mealTypeView = MealTypeView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = "Add"
        navigationController?.setNavigationBarHidden(true, animated: false)
        mealTypeView.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        title = "Add"
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
        view.backgroundColor = Asset.Colors.secondaryBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        configureSegmentedControl()
        configureAddDishButton()
        configureTableView()
        configureMealTypeView()
    }
    
    func configureSegmentedControl() {
        segmentedControl.isHidden = true
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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.addDishButtonTopOffset)
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

    func configureMealTypeView() {
        mealTypeView.onSelectType = { [weak self] mealType in
            guard let self else { return }

            self.mealType = mealType
            self.mealTypeView.isHidden = true
            navigationController?.setNavigationBarHidden(false, animated: true)

            switch mealType {
            case .breakfast:
                title = Asset.Strings.breakfast
            case .lunch:
                title = Asset.Strings.lunch
            case .diner:
                title = Asset.Strings.dinner
            case .snacks:
                title = Asset.Strings.snack
            }
        }
        view.addSubview(mealTypeView)
        mealTypeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
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
        vc.mealType = mealType

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FFAddingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearching ? filteredProducts.count : products.count
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

        cell.configure(product: isSearching ?  filteredProducts[indexPath.item] : products[indexPath.item])
        
        return cell
    }
}


// MARK: - UISearchResultsUpdating

extension FFAddingViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        isSearching = searchController.isActive

        if let searchText = searchController.searchBar.text {
            filteredProducts = products.filter { $0.name.contains(searchText) }
            tableView.reloadData()
        }
    }
}

// MARK: - UISearchResultsUpdating

extension FFAddingViewController: UISearchControllerDelegate {
}

private extension FFAddingViewController {
    enum Constants {
        enum mealTypeView {
            static let top = 100
        }
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
