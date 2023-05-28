//
//  ProductCreatingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.05.2023.
//

import UIKit

final class ProductCreatingViewController: FFBaseViewController {
    // MARK: - Subviews

    private var infoLabel = UILabel()
    private var tableView = UITableView(frame: .zero)
    private var doneButton = UIButton()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: - Layout

private extension ProductCreatingViewController {
    func configureViews() {
        view.backgroundColor = Asset.Colors.secondaryBackground
        configureInfoLabel()
        configureTableView()
        configureDoneButton()
    }

    func configureInfoLabel() {
        infoLabel.text = Asset.Strings.addYourDish
        infoLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        infoLabel.textColor = Asset.Colors.label
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints {
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
        tableView.register(
            TextFieldTableViewCell.self,
            forCellReuseIdentifier: TextFieldTableViewCell.identifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.height.equalTo(Constants.TableView.height)
            $0.top.equalTo(infoLabel.snp.bottom).offset(Constants.TableView.top)
            $0.left.right.equalToSuperview()
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
            $0.top.equalTo(tableView.snp.bottom).offset(Constants.DoneButton.top)
            $0.left.equalToSuperview().offset(Constants.DoneButton.left)
            $0.right.equalToSuperview().offset(-Constants.DoneButton.right)
        }
    }
}

// MARK: - UITableViewDelegate

extension ProductCreatingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.TableView.cellHeight
    }
}

// MARK: - UITableViewDataSource

extension ProductCreatingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
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

private extension ProductCreatingViewController {
    enum Constants {
        enum InfoLabel {
            static let top = 23
            static let left = 20
        }
        enum TableView {
            static let top = 24
            static let height = 300
            static let cellHeight = 60.0
            static let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        enum DoneButton {
            static let top = 16
            static let left = 20
            static let right = 20
            static let height = 44
            static let radius = 16.0
        }
    }
}
