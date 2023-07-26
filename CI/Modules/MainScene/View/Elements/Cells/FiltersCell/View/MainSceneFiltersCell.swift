//
//  MainSceneFiltersCell.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class MainSceneFiltersCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.layer.cornerRadius = Constants.canvasCornerRadiusValue
        contentView.layer.masksToBounds = true
    }
    
    func setup(with model: MainSceneCellViewModelType) {
        cellTitle.text = model.title
        
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        contentView.backgroundColor = AppCore.shared.uiLayer.style.colorLightGray
    }
    
    @IBOutlet private weak var cellTitle: UILabel!
}

extension MainSceneFiltersCell: NibLoadableView { }

extension MainSceneFiltersCell {
    private struct Constants {
        static let canvasCornerRadiusValue: CGFloat = 20.0
    }
}
