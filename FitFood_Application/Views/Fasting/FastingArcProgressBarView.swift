//
//  FastingArcProgressBarView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 02.06.2023.
//

import UIKit

final class FastingArcProgressBarView: UIView {
    // MARK: - Properties

    private var fastingType: FastingType = .third {
        didSet {
            layoutSubviews()
        }
    }

    // MARK: - Subviews

    private var backgroundLayer: CAShapeLayer?
    private var fastingLayer: CAShapeLayer?
    private var fastingProgressLayer: CAShapeLayer?
    private var eatingLayer: CAShapeLayer?
    private var eatingProgressLayer: CAShapeLayer?

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundLayer?.path = configureBackgroundPath()
        fastingLayer?.path = configureFastingPath()
        fastingProgressLayer?.path = configureFastingPath()
        eatingLayer?.path = configureEatingPath()
        eatingProgressLayer?.path = configureEatingPath()
    }
}

// MARK: - Layout

private extension FastingArcProgressBarView {
    func configureViews() {
        let backgroundLayer = configureBackgroundLayer()
        layer.addSublayer(backgroundLayer)
        self.backgroundLayer = backgroundLayer

        let fastingLayer = configureFastingLayer()
        layer.addSublayer(fastingLayer)
        self.fastingLayer = fastingLayer

        let fastingProgressLayer = configureFastingProgressLayer()
        layer.addSublayer(fastingProgressLayer)
        self.fastingProgressLayer = fastingProgressLayer


        let eatingLayer = configureEaingLayer()
        layer.addSublayer(eatingLayer)
        self.eatingLayer = eatingLayer

        let eatingProgressLayer = configureEaingProgressLayer()
        layer.addSublayer(eatingProgressLayer)
        self.eatingProgressLayer = eatingProgressLayer
    }

    func configureBackgroundPath() -> CGPath {
        UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: Constants.radius,
            startAngle: 1.5 * CGFloat.pi,
            endAngle: 3.5 * CGFloat.pi,
            clockwise: true
        ).cgPath
    }

    func configureBackgroundLayer() -> CAShapeLayer {
        let backGraundLayer = CAShapeLayer()

        backGraundLayer.path = configureBackgroundPath()
        backGraundLayer.strokeColor = Asset.Colors.arcProgressViewBackground.withAlphaComponent(0.1).cgColor
        backGraundLayer.lineWidth = Constants.lineWidth
        backGraundLayer.lineCap = .round
        backGraundLayer.fillColor = nil

        return backGraundLayer
    }

    func configureFastingPath() -> CGPath {
        var startAngle = CGFloat()
        var endAngle = CGFloat()

        switch fastingType {
        case .first:
            startAngle = 1.5 * CGFloat.pi + Constants.offset
            endAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (14.0 / 24.0) - Constants.offset
        case .second:
            startAngle = 1.5 * CGFloat.pi + Constants.offset
            endAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (16.0 / 24.0) - Constants.offset
        case .third:
            startAngle = 1.5 * CGFloat.pi + Constants.offset
            endAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (18.0 / 24.0) - Constants.offset
        case .fourth:
            startAngle = 1.5 * CGFloat.pi + Constants.offset
            endAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (20.0 / 24.0) - Constants.offset
        }

        return UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: Constants.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        ).cgPath
    }

    func configureFastingLayer() -> CAShapeLayer {
        let progressLayer = CAShapeLayer()

        progressLayer.path = configureFastingPath()
        progressLayer.strokeColor = Asset.Colors.orange.withAlphaComponent(0.3).cgColor
        progressLayer.lineWidth = Constants.lineWidth
        progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeEnd = 1.0

        return progressLayer
    }

    func configureFastingProgressLayer() -> CAShapeLayer {
        let progressLayer = CAShapeLayer()

        progressLayer.path = configureFastingPath()
        progressLayer.strokeColor = Asset.Colors.orange.cgColor
        progressLayer.lineWidth = Constants.lineWidth
        progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeEnd = 0.0

        return progressLayer
    }

    func configureEatingPath() -> CGPath {
        var startAngle = CGFloat()
        var endAngle = CGFloat()

        switch fastingType {
        case .first:
            startAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (14.0 / 24.0) + Constants.offset
            endAngle = 3.5 * CGFloat.pi - Constants.offset
        case .second:
            startAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (16.0 / 24.0) + Constants.offset
            endAngle = 3.5 * CGFloat.pi - Constants.offset
        case .third:
            startAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (18.0 / 24.0) + Constants.offset
            endAngle = 3.5 * CGFloat.pi - Constants.offset
        case .fourth:
            startAngle = 1.5 * CGFloat.pi + (2 * CGFloat.pi) * (20.0 / 24.0) + Constants.offset
            endAngle = 3.5 * CGFloat.pi - Constants.offset
        }

        return UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: Constants.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        ).cgPath
    }

    func configureEaingLayer() -> CAShapeLayer {
        let progressLayer = CAShapeLayer()

        progressLayer.path = configureEatingPath()
        progressLayer.strokeColor = Asset.Colors.green.withAlphaComponent(0.3).cgColor
        progressLayer.lineWidth = Constants.lineWidth
        progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeEnd = 1.0

        return progressLayer
    }

    func configureEaingProgressLayer() -> CAShapeLayer {
        let progressLayer = CAShapeLayer()

        progressLayer.path = configureEatingPath()
        progressLayer.strokeColor = Asset.Colors.green.cgColor
        progressLayer.lineWidth = Constants.lineWidth
        progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeEnd = 0.0

        return progressLayer
    }
}

// MARK: - Public methods

extension FastingArcProgressBarView {
    func resetFastingType(fastingType: FastingType) {
        self.fastingType = fastingType
    }

    func resetProgressBar(fastingRation: Double, eatingRetio: Double) {
        fastingProgressLayer?.strokeEnd = fastingRation
        eatingProgressLayer?.strokeEnd = eatingRetio
    }
}

// MARK: - Constants

private extension FastingArcProgressBarView {
    enum Constants {
        static let radius = 120.0
        static let lineWidth = 20.0
        static let offset = 0.1
    }
}

