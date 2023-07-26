//
//  PickerViewItemRegular.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class PickerViewItemRegular: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        contentTitle = UILabel()
        
        guard let contentTitle else { return }
        
        contentTitle.textAlignment = .center
        contentTitle.font = AppCore.shared.uiLayer.style.labelTitleFontExtraLarge
        
        addSubview(contentTitle)
    }
    
    private func setupConstraints() {
        guard let contentTitle else { return }
        
        contentTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contentTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setup(with model: PickerViewItemRegularViewModelType) {
        guard let contentTitle else { return }
        
        contentTitle.text = model.contentData
    }
    
    private var contentTitle: UILabel?
}
