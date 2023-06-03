//
//  StarsRatingView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 03.06.2023.
//

import UIKit

final class StarsRatingView: UIView {
    // MARK: - Subviews

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

private extension StarsRatingView {
    func configureViews() {
        configureStackView()
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }

    func configureRating(_ rating: Int) {
        for index in 1...5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = index <= rating ? Asset.Images.starFill.withTintColor(Asset.Colors.green) : Asset.Images.star.withTintColor(Asset.Colors.green)
            stackView.addArrangedSubview(imageView)
        }
    }
}

// MARK: - Public configure

extension StarsRatingView {
    func configure(raiting: Int) {
        guard 0 < raiting, raiting < 6 else {
            return
        }

        configureRating(raiting)
    }
}
