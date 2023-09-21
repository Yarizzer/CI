//
//  TestSceneTestView.swift
//  CI
//
//  Created by Yaroslav Abaturov on 21.09.2023.
//

import UIKit

class TestSceneTestView: UIView {
    //MARK: - initializers
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        layer.cornerRadius = frame.width / 3
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setupView() {
        canvas = UIView()
        backgroundImage = UIImageView()
        imageView = UIImageView()
        textLabel = UILabel()
        
        guard let canvas, let backgroundImage, let imageView, let textLabel else { return }
        
        canvas.backgroundColor = AppCore.shared.uiLayer.style.colorLightGray
        
        textLabel.textAlignment = .center
        textLabel.font = AppCore.shared.uiLayer.style.hugeFont
        
        canvas.addSubview(backgroundImage)
        canvas.addSubview(imageView)
        canvas.addSubview(textLabel)
        
        addSubview(canvas)
    }
    
    private func setupConstraints() {
        guard let canvas, let backgroundImage, let imageView, let textLabel else { return }
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        canvas.topAnchor.constraint(equalTo: topAnchor).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        backgroundImage.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: canvas.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: canvas.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: canvas.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: canvas.trailingAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
    }
    
    func setup(with model: TestSceneTestViewModelType) {
        self.model = model
        
        guard let backgroundImage, let imageView, let textLabel else { return }
        
        textLabel.text = model.textData
        
        guard let image = UIImage(named: model.imageNameValue) else { return }
        
        backgroundImage.image = image
        imageView.image = image
        
        backgroundImage.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.mask = textLabel.layer
        imageView.layer.masksToBounds = true
        
        #warning("remove 'magic numbers'")
        UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) { [weak self] in
            backgroundImage.alpha = 0.0
        }
    }
    
    private var model: TestSceneTestViewModelType?
    
    private var canvas: UIView?
    private var backgroundImage: UIImageView?
    private var imageView: UIImageView?
    private var textLabel: UILabel?
}

extension TestSceneTestView {
    private struct Constants {
        static let textOffsetValue: CGFloat = 50.0
    }
}
