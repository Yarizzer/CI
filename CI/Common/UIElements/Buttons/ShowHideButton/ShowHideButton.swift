//
//  ShowHideButton.swift
//  CI
//
//  Created by Yaroslav Abaturov on 27.07.2023.
//

import UIKit

class ShowHideButton: UIButton {
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
        
        self.clipsToBounds = true
        layer.cornerRadius = frame.width / 3
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupView() {
        self.viewIsHidden = true
    }
    
    private var viewIsHidden: Bool? {
        didSet {
            guard let image = UIImage(named: viewIsHidden ?? true ? Constants.isHiddenImageName : Constants.isShownImageName) else { return }
            
            self.setBackgroundImage(image, for: .normal)
        }
    }
    
    func toggle() {
        viewIsHidden?.toggle()
    }
}

extension ShowHideButton {
    private enum ButtonState {
        case isHidden, isShown
    }
    
    private struct Constants {
        static let isHiddenImageName = "Sliders"
        static let isShownImageName = "Close"
    }
}
