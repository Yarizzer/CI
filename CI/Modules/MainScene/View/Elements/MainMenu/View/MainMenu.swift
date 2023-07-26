//
//  MainMenu.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class MainMenu: UIView {
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
    //MARK: - System
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        guard let canvas, let textInputView else { return }
//
//        canvas.layer.cornerRadius = Constants.canvasCornerRadiusValue
//        canvas.layer.masksToBounds = true
//
//        textInputView.layer.cornerRadius = textInputView.frame.height / 2
//        textInputView.layer.masksToBounds = true
    }
    //MARK: - SetupView
    private func setupView() {
//        self.alpha = Constants.alpha.min
//
//        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
//        canvas = UIView()
//        logoView = UIImageView()
//        textInputView = UITextField()
//        confirmButton = ConfirmButton()
//        closeButton = CloseButton()
//
//        guard let canvas, let blurEffectView, let logoView, let textInputView, let confirmButton, let closeButton else { return }
//
//        canvas.backgroundColor = AppCore.shared.uiLayer.style.colorOrange
//
//        logoView.contentMode = .scaleAspectFit
//
//        textInputView.backgroundColor = traitCollection.userInterfaceStyle == .dark ? AppCore.shared.uiLayer.style.colorDarkGray : AppCore.shared.uiLayer.style.colorLightGray
//        textInputView.textColor = traitCollection.userInterfaceStyle == .dark ? AppCore.shared.uiLayer.style.colorLightGray : AppCore.shared.uiLayer.style.colorDarkGray
//        textInputView.clearButtonMode = .whileEditing
//        textInputView.addTarget(self, action: #selector(didChangedTextInputValue), for: .editingChanged)
//
//        confirmButton.alpha = Constants.alpha.min
//        confirmButton.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
//
//        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
//
//        canvas.addSubview(logoView)
//        canvas.addSubview(textInputView)
//        canvas.addSubview(confirmButton)
//        canvas.addSubview(closeButton)
//
//        addSubview(blurEffectView)
//        addSubview(canvas)
    }
    //MARK: - SetupConstraints
    private func setupConstraints() {
//        guard let canvas, let blurEffectView, let logoView, let textInputView, let confirmButton, let closeButton else { return }
//
//        canvas.translatesAutoresizingMaskIntoConstraints = false
//        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
//        logoView.translatesAutoresizingMaskIntoConstraints = false
//        textInputView.translatesAutoresizingMaskIntoConstraints = false
//        confirmButton.translatesAutoresizingMaskIntoConstraints = false
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//
//        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//
//        canvas.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        canvas.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        canvas.widthAnchor.constraint(equalToConstant: Constants.canvasWidthValue).isActive = true
//        canvas.heightAnchor.constraint(equalToConstant: Constants.canvasHeightValue).isActive = true
//
//        closeButton.centerXAnchor.constraint(equalTo: canvas.centerXAnchor).isActive = true
//        closeButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidthHeightValue).isActive = true
//        closeButton.heightAnchor.constraint(equalToConstant: Constants.buttonsWidthHeightValue).isActive = true
//        closeButton.bottomAnchor.constraint(equalTo: canvas.bottomAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//
//        confirmButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidthHeightValue).isActive = true
//        confirmButton.heightAnchor.constraint(equalToConstant: Constants.buttonsWidthHeightValue).isActive = true
//        confirmButton.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//        confirmButton.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//
//        //textInputView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: Constants.elementsPaddingValue).isActive = true
//        textInputView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
//        textInputView.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//        textInputView.heightAnchor.constraint(equalToConstant: Constants.textInputHeightValue).isActive = true
//        textInputView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//
//        logoView.topAnchor.constraint(equalTo: canvas.topAnchor, constant: Constants.elementsPaddingValue).isActive = true
//        logoView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
//        logoView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
//        logoView.bottomAnchor.constraint(equalTo: textInputView.topAnchor, constant: -Constants.elementsPaddingValue).isActive = true
    }
    //MARK: - SetupViewModel
    func setup(with model: MainMenuViewModelType) {
        self.model = model
        
//        guard let logoView, let textInputView else { return }
//
//        let image = UIImage(named: model.logoImageName)
//        logoView.image = image
//
//        textInputView.placeholder = model.textInputViewPlaceholder
    }
    
    private func setupProvider() {
        guard let pickerView, let providerModel = model as? PickerViewProviderViewModel else { return }
        
        provider = PickerViewProvider(for: pickerView, with: providerModel)
        
        provider?.onConfigureView = { row, component in
            switch model.getPickerType(for: row, for: component) {
            case .regular:
                guard let viewModel = model.getPickerViewModel(for: row, component: component) else { return PickerViewReusableViewRegular() }
                
                let view = PickerViewReusableViewRegular()
                view.setup(with: viewModel)
                
                return view
            }
        }
        
        provider?.didSelectRow = { [weak self] row in
            self?.interactor?.makeRequest(requestType: .routeToScene(forRow: row))
        }
    }
    
    private var model: MainMenuViewModelType?
    
    private var provider: PickerViewProviderType?
    
    private var canvas: UIView?
    private var pickerView: UIPickerView?
}