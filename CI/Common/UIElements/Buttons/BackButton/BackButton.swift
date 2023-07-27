//
//  BackButton.swift
//  CI
//
//  Created by Yaroslav Abaturov on 27.07.2023.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = frame.height / 2
        
        configureSign()
    }
    
    private func setupView() {
        signShapeLayer = CAShapeLayer()
        
        setTitle(Constants.defaultTitle, for: .normal)
        
        backgroundColor = AppCore.shared.uiLayer.style.colorLightGray

        layer.addSublayer(signShapeLayer)
    }
    
    private func configureSign() {
        signShapeLayer.frame = bounds
        
        let signPath = UIBezierPath()
        
        let firstPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height / 4)
        let secondPoint = CGPoint(x: self.frame.width / 3, y: self.frame.height / 2)
        let thirdPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height - (self.frame.height / 4))
        
        signPath.move(to: firstPoint)
        signPath.addLine(to: secondPoint)
        signPath.addLine(to: thirdPoint)
        
        signShapeLayer.path = signPath.cgPath
    }
    
    func appear() {
        self.signShapeLayer.strokeEnd = Constants.signStrokeEnd.default
    }
    
    private var signShapeLayer: CAShapeLayer! {
        didSet {
            signShapeLayer.fillColor = AppCore.shared.uiLayer.style.colorClear.cgColor
            signShapeLayer.strokeColor = AppCore.shared.uiLayer.style.colorDarkGray.cgColor
            signShapeLayer.strokeEnd = Constants.signStrokeEnd.initial
            signShapeLayer.lineWidth = AppCore.shared.uiLayer.style.layerLineWidth
            signShapeLayer.lineCap = .round
        }
    }
}

extension BackButton {
    private struct Constants {
        static let signStrokeEnd: (initial: CGFloat, default: CGFloat) = (initial: 0, default: 1)
        
        static let defaultTitle = ""
    }
}
