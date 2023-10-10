//
//  ProductCreatingViewController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 28.05.2023.
//

import UIKit

final class ProductCreatingViewController: FFBaseViewController {
    // MARK: - Properties

    private var product = FFProduct(id: "", name: "", calories: 0.0, carbs: 0.0, fat: 0.0, protein: 0.0)

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
            $0.left.equalToSuperview().offset(Constants.TableView.side)
            $0.right.equalToSuperview().offset(-Constants.TableView.side)
        }
    }

    func configureDoneButton() {
        doneButton.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }

                self.navigationController?.popViewController(animated: true)
            }, for: .touchUpInside
        )
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

        switch indexPath.row {
        case 0:
            cell.configure(placeholderText: "Name")
            cell.onTextDidChange = { [weak self] text in
                guard let self else { return }
                self.product.name = text
            }
        case 1:
            cell.configure(placeholderText: "Protein (per 100 gr.)")
            cell.onTextDidChange = { [weak self] text in
                guard let self else { return }
                self.product.protein = Double(text) ?? 0.0
            }
        case 2:
            cell.configure(placeholderText: "Fats (per 100 gr..)")
            cell.onTextDidChange = { [weak self] text in
                guard let self else { return }
                self.product.fat = Double(text) ?? 0.0
            }
        case 3:
            cell.configure(placeholderText: "Carbs (per 100 gr..)")
            cell.onTextDidChange = { [weak self] text in
                guard let self else { return }
                self.product.carbs = Double(text) ?? 0.0
            }
        case 4:
            cell.configure(placeholderText: "Kcal (per 100 gr..)")
            cell.onTextDidChange = { [weak self] text in
                guard let self else { return }
                self.product.calories = Double(text) ?? 0.0
            }
        default:
            break
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
            static let side = 20
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
