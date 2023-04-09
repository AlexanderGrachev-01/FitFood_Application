//
//  ArcProgressBarView.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 09.04.2023.
//

import UIKit

class ArcProgressBarView: UIView {
    // MARK: - Subviews
    
    private var backgroundLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    
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
        
        backgroundLayer?.path = configureProgressBarPath()
        progressLayer?.path = configureProgressBarPath()
    }
}

// MARK: - Layout

private extension ArcProgressBarView {
    func configureViews() {
        let backgroundLayer = configureBackgroundLayer()
        layer.addSublayer(backgroundLayer)
        self.backgroundLayer = backgroundLayer
        
        let progressLayer = configureProgressLayer()
        layer.addSublayer(progressLayer)
        self.progressLayer = progressLayer
    }
    
    func configureProgressBarPath() -> CGPath {
        UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: Constants.radius,
            startAngle: 3 * CGFloat.pi / 4,
            endAngle: CGFloat.pi / 4,
            clockwise: true
        ).cgPath
    }
    
    func configureBackgroundLayer() -> CAShapeLayer {
        let backGraundLayer = CAShapeLayer()
        
        backGraundLayer.path = configureProgressBarPath()
        backGraundLayer.strokeColor = Asset.Colors.arcProgressViewBackground.cgColor
        backGraundLayer.lineWidth = Constants.lineWidth
        backGraundLayer.lineCap = .round
        backGraundLayer.fillColor = nil
        
        return backGraundLayer
    }
    
    func configureProgressLayer() -> CAShapeLayer {
        let progressLayer = CAShapeLayer()
        
        progressLayer.path = configureProgressBarPath()
        progressLayer.strokeColor = Asset.Colors.arcProgressView.cgColor
        progressLayer.lineWidth = Constants.lineWidth
        progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeEnd = 0
        
        return progressLayer
    }
}

// MARK: - Public methods

extension ArcProgressBarView {
    func resetProgressBar(ratio: Double) {
        progressLayer?.strokeEnd = ratio
    }
}

// MARK: - Constants

private extension ArcProgressBarView {
    enum Constants {
        static let radius = 62.0
        static let lineWidth = 12.0
    }
}
