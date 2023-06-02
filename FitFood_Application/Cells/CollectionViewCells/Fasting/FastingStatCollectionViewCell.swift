//
//  FastingStatCollectionViewCell.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 01.06.2023.
//

import UIKit

final class FastingStatCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier

    static let identifier = "FastingStatCollectionViewCell"

    // MARK: - Subviews

    private var title = UILabel()
    private var backView = UIView()
    private var stackView = UIStackView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

private extension FastingStatCollectionViewCell {
    func configureViews() {
        contentView.backgroundColor = .clear
        configureTitle()
        configureBackView()
        configureStackView()
    }

    func configureTitle() {
        title.text = Asset.Strings.yourFasting
        title.textColor = Asset.Colors.label
        title.font = .systemFont(ofSize: 14, weight: .semibold)
        contentView.addSubview(title)
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.Title.left)
        }
    }

    func configureBackView() {
        backView.backgroundColor = Asset.Colors.secondaryBackground
        backView.layer.cornerRadius = Constants.BackView.cornerRadius
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(Constants.BackView.top)
            $0.left.right.bottom.equalToSuperview()
        }
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        backView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        configureStatViews()
    }

    func configureStatViews() {
        let curStatView = ImageTwoLabelsView()
        curStatView.configure(image: Asset.Images.fireCur, info: "2 Days", name: Asset.Strings.curent)
        stackView.addArrangedSubview(curStatView)

        let longStatView = ImageTwoLabelsView()
        longStatView.configure(image: Asset.Images.biceps, info: "31 Days", name: Asset.Strings.longest)
        stackView.addArrangedSubview(longStatView)

        let allStatView = ImageTwoLabelsView()
        allStatView.configure(image: Asset.Images.checkMark, info: "44 Days", name: Asset.Strings.all)
        stackView.addArrangedSubview(allStatView)

        let totalStatView = ImageTwoLabelsView()
        totalStatView.configure(image: Asset.Images.clock, info: "704 hr", name: Asset.Strings.total)
        stackView.addArrangedSubview(totalStatView)
    }
}

// MARK: - Constants

private extension FastingStatCollectionViewCell {
    enum Constants {
        enum Title {
            static let left = 8
        }
        enum BackView {
            static let cornerRadius = 10.0
            static let top = 8
        }
    }
}
