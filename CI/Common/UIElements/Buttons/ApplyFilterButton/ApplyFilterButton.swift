//
//  ApplyFilterButton.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class ApplyFilterButton: UIButton {
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
    }
    
    private func setupView() {
        backgroundColor = AppCore.shared.uiLayer.style.colorGreen
        setTitle(Constants.titleValue, for: .normal)
    }
}

extension ApplyFilterButton {
    private struct Constants {
        static let titleValue = "Apply filter"
    }
}
