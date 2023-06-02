//
//  ProductAddingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.05.2023.
//

import UIKit

final class ProductAddingViewController: FFBaseViewController {
    private var isFavourite = false {
        didSet {
            if isFavourite {
                favouritesButton.setImage(
                    Asset.Images.starFill.withTintColor(Asset.Colors.green),
                    for: .normal
                )
            } else {
                favouritesButton.setImage(
                    Asset.Images.star.withTintColor(Asset.Colors.green),
                    for: .normal
                )
            }
        }
    }

    // MARK: - Subviews

    private var nameLabel = UILabel()
    private var tableView = UITableView(frame: .zero)
    private var doneButton = UIButton()
    private var proteinImageView = UIImageView()
    private var proteinLabel = UILabel()
    private var fatImageView = UIImageView()
    private var fatLabel = UILabel()
    private var carbsImageView = UIImageView()
    private var carbsLabel = UILabel()
    private var favouritesButton = UIButton()
    private var kcalLabel = UILabel()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: - Layout

private extension ProductAddingViewController {
    func configureViews() {
        view.backgroundColor = Asset.Colors.secondaryBackground
        configureNameLabel()
        configureTableView()
        configureProteinImageView()
        configureProteinLabel()
        configureFatImageView()
        configureFatLabel()
        configureCarbsImageView()
        configureCarbsLabel()
        configureFavouritesButton()
        configureKcalLabel()
        configureDoneButton()
    }

    func configureNameLabel() {
        nameLabel.text = "Fruit salad"
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameLabel.textColor = Asset.Colors.label
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.InfoLabel.top)
            $0.left.equalToSuperview().offset(Constants.InfoLabel.left)
        }
    }

    func configureTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = Asset.Colors.secondaryBackground
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.contentInset = Constants.TableView.contentInset
        tableView.backgroundColor = .black
        tableView.register(
            TextFieldTableViewCell.self,
            forCellReuseIdentifier: TextFieldTableViewCell.identifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.height.equalTo(Constants.TableView.height)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.TableView.top)
            $0.left.right.equalToSuperview()
        }
    }

    func configureProteinImageView() {
        proteinImageView.image = Asset.Images.protein
        proteinImageView.contentMode = .scaleAspectFit
        view.addSubview(proteinImageView)
        proteinImageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.Items.size)
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.Items.top)
            $0.left.equalToSuperview().offset(Constants.DoneButton.left)
        }
    }

    func configureProteinLabel() {
        proteinLabel.text = "30"
        proteinLabel.font = .systemFont(ofSize: 14, weight: .regular)
        proteinLabel.textColor = Asset.Colors.lightGray
        view.addSubview(proteinLabel)
        proteinLabel.snp.makeConstraints {
            $0.centerY.equalTo(proteinImageView)
            $0.left.equalTo(proteinImageView.snp.right).offset(Constants.Items.labelSpacing)
        }
    }

    func configureFatImageView() {
        fatImageView.image = Asset.Images.fat
        fatImageView.contentMode = .scaleAspectFit
        view.addSubview(fatImageView)
        fatImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.Items.size)
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.Items.top)
            $0.left.equalTo(proteinImageView.snp.right).offset(Constants.Items.itemSpacing)
        }
    }

    func configureFatLabel() {
        fatLabel.text = "30"
        fatLabel.font = .systemFont(ofSize: 14, weight: .regular)
        fatLabel.textColor = Asset.Colors.lightGray
        view.addSubview(fatLabel)
        fatLabel.snp.makeConstraints {
            $0.centerY.equalTo(fatImageView)
            $0.left.equalTo(fatImageView.snp.right).offset(Constants.Items.labelSpacing)
        }
    }

    func configureCarbsImageView() {
        carbsImageView.image = Asset.Images.carbs
        carbsImageView.contentMode = .scaleAspectFit
        view.addSubview(carbsImageView)
        carbsImageView.snp.makeConstraints {
            $0.width.height.equalTo(Constants.Items.size)
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.Items.top)
            $0.left.equalTo(fatImageView.snp.right).offset(Constants.Items.itemSpacing)
        }
    }

    func configureCarbsLabel() {
        carbsLabel.text = "30"
        carbsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        carbsLabel.textColor = Asset.Colors.lightGray
        view.addSubview(carbsLabel)
        carbsLabel.snp.makeConstraints {
            $0.centerY.equalTo(carbsImageView)
            $0.left.equalTo(carbsImageView.snp.right).offset(Constants.Items.labelSpacing)
        }
    }

    func configureFavouritesButton() {
        favouritesButton.setImage(
            Asset.Images.star.withTintColor(Asset.Colors.green),
            for: .normal
        )
        favouritesButton.setImage(
            Asset.Images.starFill.withTintColor(Asset.Colors.green),
            for: .highlighted
        )
        favouritesButton.contentMode = .scaleAspectFit
        favouritesButton.addTarget(self, action: #selector(favouritesAction), for: .touchDown)
        view.addSubview(favouritesButton)
        favouritesButton.snp.makeConstraints {
            $0.width.height.equalTo(Constants.FavouritesButton.size)
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.FavouritesButton.top)
            $0.right.equalToSuperview().offset(-Constants.FavouritesButton.right)
        }
    }
    
    func configureKcalLabel() {
        kcalLabel.text = "47 kcal"
        kcalLabel.textColor = Asset.Colors.lightGray
        kcalLabel.font = .systemFont(ofSize: 17, weight: .regular)
        kcalLabel.textAlignment = .right
        view.addSubview(kcalLabel)
        kcalLabel.snp.makeConstraints {
            $0.centerY.equalTo(favouritesButton)
            $0.right.equalTo(favouritesButton.snp.left).offset(-Constants.KcalLabel.right)
        }
    }

    func configureDoneButton() {
        doneButton.setTitle(Asset.Strings.done, for: .normal)
        doneButton.layer.cornerRadius = Constants.DoneButton.radius
        doneButton.backgroundColor = Asset.Colors.green
        doneButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        doneButton.setTitleColor(Asset.Colors.white, for: .normal)
        doneButton.setTitleColor(Asset.Colors.lightGray, for: .highlighted)
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints {
            $0.height.equalTo(Constants.DoneButton.height)
            $0.top.equalTo(favouritesButton.snp.bottom).offset(Constants.DoneButton.top)
            $0.left.equalToSuperview().offset(Constants.DoneButton.left)
            $0.right.equalToSuperview().offset(-Constants.DoneButton.right)
        }
    }
}

// MARK: - Actions

extension ProductAddingViewController {
    @objc
    private func favouritesAction() {
        isFavourite = !isFavourite
    }
}

// MARK: - UITableViewDelegate

extension ProductAddingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.TableView.cellHeight
    }
}

// MARK: - UITableViewDataSource

extension ProductAddingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TextFieldTableViewCell.identifier,
            for: indexPath
        ) as? TextFieldTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }
}

// MARK: - Constants

private extension ProductAddingViewController {
    enum Constants {
        enum InfoLabel {
            static let top = 23
            static let left = 20
        }
        enum TableView {
            static let top = 24
            static let height = 60
            static let cellHeight = 60.0
            static let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
        }
        enum DoneButton {
            static let top = 24
            static let left = 20
            static let right = 20
            static let height = 44
            static let radius = 16.0
        }
        enum FavouritesButton {
            static let size = 24
            static let top = 10
            static let right = 20
        }
        enum KcalLabel {
            static let right = 12
        }
        enum Items {
            static let size = 24
            static let top = 10
            static let itemSpacing = 34
            static let labelSpacing = 4
        }
    }
}
