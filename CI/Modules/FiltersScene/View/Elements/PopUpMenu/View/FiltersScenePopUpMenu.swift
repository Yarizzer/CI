//
//  FiltersScenePopUpMenu.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class FiltersScenePopUpMenu: UIView {
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
        
        #warning("remove if empty")
    }
    //MARK: - SetupView
    private func setupView() {
        backgroundColor = AppCore.shared.uiLayer.style.colorClear
        
        initializeElements()
        setupFirstLayer()
        setupSecondLayer()
        setupThirdLayer()
        setupFourthLayer()
        setupFifthLayer()
        
        //Containers
        guard let canvas, let secondLayerStack, let thirdLayerTopStack, let thirdLayerBottomStack, let fourthLayerTopLeftStack, let fourthLayerTopRightStack, let fourthLayerBottomLeftStack, let fourthLayerBottomRightStack else { return }
        //Elements
        guard let showHideButton, let pickerView, let topLeftSlider, let topLeftSliderValueLabel, let topRightSlider, let topRightSliderValueLabel, let bottomLeftSlider, let bottomLeftSliderValueLabel, let bottomRightSlider, let bottomRightSliderValueLabel, let applyButton else { return }
        
        fourthLayerBottomRightStack.addArrangedSubview(bottomRightSliderValueLabel)
        fourthLayerBottomRightStack.addArrangedSubview(bottomRightSlider)
        fourthLayerBottomLeftStack.addArrangedSubview(bottomLeftSliderValueLabel)
        fourthLayerBottomLeftStack.addArrangedSubview(bottomLeftSlider)
        fourthLayerTopRightStack.addArrangedSubview(topRightSliderValueLabel)
        fourthLayerTopRightStack.addArrangedSubview(topRightSlider)
        fourthLayerTopLeftStack.addArrangedSubview(topLeftSliderValueLabel)
        fourthLayerTopLeftStack.addArrangedSubview(topLeftSlider)
        
        thirdLayerTopStack.addArrangedSubview(fourthLayerTopLeftStack)
        thirdLayerTopStack.addArrangedSubview(fourthLayerTopRightStack)
        thirdLayerBottomStack.addArrangedSubview(fourthLayerBottomLeftStack)
        thirdLayerBottomStack.addArrangedSubview(fourthLayerBottomRightStack)
        
        secondLayerStack.addArrangedSubview(thirdLayerTopStack)
        secondLayerStack.addArrangedSubview(thirdLayerBottomStack)
        
        canvas.addSubview(applyButton)
        canvas.addSubview(secondLayerStack)
        canvas.addSubview(pickerView)
        
        addSubview(showHideButton)
        addSubview(canvas)
    }
    
    //MARK: - Elements initialization
    private func initializeElements() {
        //Containers
        canvas = UIView()
        secondLayerStack = UIStackView()
        thirdLayerTopStack = UIStackView()
        thirdLayerBottomStack = UIStackView()
        fourthLayerTopLeftStack = UIStackView()
        fourthLayerTopRightStack = UIStackView()
        fourthLayerBottomLeftStack = UIStackView()
        fourthLayerBottomRightStack = UIStackView()
        //Elements
        showHideButton = ShowHideButton()
        pickerView = UIPickerView()
        topLeftSlider = UISlider()
        topLeftSliderValueLabel = UILabel()
        topRightSlider = UISlider()
        topRightSliderValueLabel = UILabel()
        bottomLeftSlider = UISlider()
        bottomLeftSliderValueLabel = UILabel()
        bottomRightSlider = UISlider()
        bottomRightSliderValueLabel = UILabel()
        applyButton = ApplyFilterButton()
    }
    //MARK: - Layers setup
    private func setupFirstLayer() {
        guard let canvas, let showHideButton else { return }
        
        canvas.backgroundColor = AppCore.shared.uiLayer.style.colorLightGray
        
        showHideButton.backgroundColor = AppCore.shared.uiLayer.style.colorLightGray
        showHideButton.addTarget(self, action: #selector(showHideButtonAction), for: .touchUpInside)
    }
    private func setupSecondLayer() {
        guard let secondLayerStack, let applyButton else { return }
        
        secondLayerStack.axis = .vertical
        secondLayerStack.alignment = .fill
        secondLayerStack.distribution = .fillEqually
        
        applyButton.addTarget(self, action: #selector(applyButtonAction), for: .touchUpInside)
    }
    private func setupThirdLayer() {
        guard let thirdLayerTopStack, let thirdLayerBottomStack else { return }
        
        thirdLayerTopStack.axis = .horizontal
        thirdLayerTopStack.alignment = .fill
        thirdLayerTopStack.distribution = .fillEqually
        thirdLayerTopStack.spacing = Constants.elementsPaddingValue
        
        thirdLayerBottomStack.axis = .horizontal
        thirdLayerBottomStack.alignment = .fill
        thirdLayerBottomStack.distribution = .fillEqually
        thirdLayerBottomStack.spacing = Constants.elementsPaddingValue
    }
    private func setupFourthLayer() {
        guard let fourthLayerTopLeftStack, let fourthLayerTopRightStack, let fourthLayerBottomLeftStack, let fourthLayerBottomRightStack else { return }
        
        fourthLayerTopLeftStack.axis = .vertical
        fourthLayerTopLeftStack.alignment = .fill
        fourthLayerTopLeftStack.distribution = .fillEqually
        
        fourthLayerTopRightStack.axis = .vertical
        fourthLayerTopRightStack.alignment = .fill
        fourthLayerTopRightStack.distribution = .fillEqually
        
        fourthLayerBottomLeftStack.axis = .vertical
        fourthLayerBottomLeftStack.alignment = .fill
        fourthLayerBottomLeftStack.distribution = .fillEqually
        
        fourthLayerBottomRightStack.axis = .vertical
        fourthLayerBottomRightStack.alignment = .fill
        fourthLayerBottomRightStack.distribution = .fillEqually
    }
    private func setupFifthLayer() {
        guard let topLeftSlider, let topLeftSliderValueLabel, let topRightSlider, let topRightSliderValueLabel, let bottomLeftSlider, let bottomLeftSliderValueLabel, let bottomRightSlider, let bottomRightSliderValueLabel else { return }
        
        topLeftSlider.value = Constants.slidersInitialValue
        topLeftSlider.addTarget(self, action: #selector(topLeftSliderValueDidChanged), for: .valueChanged)
        topLeftSliderValueLabel.text = "\(topLeftSlider.value)"
        topLeftSliderValueLabel.textAlignment = .center
        topLeftSliderValueLabel.textColor = AppCore.shared.uiLayer.style.colorDarkGray
        
        topRightSlider.value = Constants.slidersInitialValue
        topRightSlider.addTarget(self, action: #selector(topRightSliderValueDidChanged), for: .valueChanged)
        topRightSliderValueLabel.text = "\(topRightSlider.value)"
        topRightSliderValueLabel.textAlignment = .center
        topRightSliderValueLabel.textColor = AppCore.shared.uiLayer.style.colorDarkGray
        
        bottomLeftSlider.value = Constants.slidersInitialValue
        bottomLeftSlider.addTarget(self, action: #selector(bottomLeftSliderValueDidChanged), for: .valueChanged)
        bottomLeftSliderValueLabel.text = "\(bottomLeftSlider.value)"
        bottomLeftSliderValueLabel.textAlignment = .center
        bottomLeftSliderValueLabel.textColor = AppCore.shared.uiLayer.style.colorDarkGray
        
        bottomRightSlider.value = Constants.slidersInitialValue
        bottomRightSlider.addTarget(self, action: #selector(bottomRightSliderValueDidChanged), for: .valueChanged)
        bottomRightSliderValueLabel.text = "\(bottomRightSlider.value)"
        bottomRightSliderValueLabel.textAlignment = .center
        bottomRightSliderValueLabel.textColor = AppCore.shared.uiLayer.style.colorDarkGray
    }
    
    //MARK: - SetupConstraints
    private func setupConstraints() {
        //First-line elements
        guard let showHideButton, let canvas else { return }
        
        showHideButton.translatesAutoresizingMaskIntoConstraints = false
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        showHideButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        showHideButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.showHideButtonTrailingOffset).isActive = true
        showHideButton.widthAnchor.constraint(equalToConstant: Constants.showHideButtonWidthHeightValue).isActive = true
        showHideButton.heightAnchor.constraint(equalToConstant: Constants.showHideButtonWidthHeightValue).isActive = true
        
        canvas.topAnchor.constraint(equalTo: showHideButton.bottomAnchor).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //Second-line elements
        guard let secondLayerStack, let pickerView, let applyButton else { return }
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        secondLayerStack.translatesAutoresizingMaskIntoConstraints = false
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        
        applyButton.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
        applyButton.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        applyButton.bottomAnchor.constraint(equalTo: canvas.bottomAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        applyButton.heightAnchor.constraint(equalToConstant: Constants.applyButtonHeightValue).isActive = true
        
        secondLayerStack.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
        secondLayerStack.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        secondLayerStack.bottomAnchor.constraint(equalTo: applyButton.topAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        secondLayerStack.heightAnchor.constraint(equalToConstant: Constants.elementsViewsStackHeightValue).isActive = true
        
        pickerView.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: secondLayerStack.topAnchor).isActive = true
    }
    //MARK: - SetupViewModel
    func setup(with model: FiltersScenePopUpMenuViewModelType) {
        self.model = model
        
        setupProvider()
    }
    
    private func setupProvider() {
        guard let pickerView, let providerModel = model as? PickerViewProviderViewModel else { return }
        
        provider = PickerViewProvider(for: pickerView, with: providerModel)
        
        provider?.onConfigureView = { [weak self] row, component in
            guard let itemModel = self?.model?.getItemModel(for: row, component: component) else { return PickerViewCIFilterItem() }
            
//            guard let item = (item as? PickerViewItemRegularViewModelType) else { return PickerViewCIFilterItem() }
            
            let view = PickerViewCIFilterItem()
            view.setup(with: itemModel)
            
            return view
        }
        
        provider?.didSelectRow = extractSelf { sSelf, row in
            sSelf.model?.updateSelectItemIndex(with: row)
        }
    }
    
    @objc private func showHideButtonAction() {
        guard let showHideButton else { return }
        
        showHideButton.toggle() { [weak self] isHidden in
            self?.model?.updateNeedToHideValue(with: isHidden)
        }
    }
    
    @objc private func topLeftSliderValueDidChanged() {
        guard let value = topLeftSlider?.value else { return }
        
        topLeftSliderValueLabel?.text = "\(value)"
    }
    
    @objc private func topRightSliderValueDidChanged() {
        guard let value = topRightSlider?.value else { return }
        
        topRightSliderValueLabel?.text = "\(value)"
    }
    
    @objc private func bottomLeftSliderValueDidChanged() {
        guard let value = bottomLeftSlider?.value else { return }
        
        bottomLeftSliderValueLabel?.text = "\(value)"
    }
    
    @objc private func bottomRightSliderValueDidChanged() {
        guard let value = bottomRightSlider?.value else { return }
        
        bottomRightSliderValueLabel?.text = "\(value)"
    }
    
    @objc private func applyButtonAction() {
        model?.applyFilters()
    }
    
    private var model: FiltersScenePopUpMenuViewModelType?
    
    private var provider: PickerViewProviderType?
    
    private var showHideButton: ShowHideButton?
    private var canvas: UIView?
    private var secondLayerStack: UIStackView?
    private var thirdLayerTopStack: UIStackView?
    private var thirdLayerBottomStack: UIStackView?
    private var fourthLayerTopLeftStack: UIStackView?
    private var fourthLayerTopRightStack: UIStackView?
    private var fourthLayerBottomLeftStack: UIStackView?
    private var fourthLayerBottomRightStack: UIStackView?
    
    private var pickerView: UIPickerView?
    private var topLeftSlider: UISlider?
    private var topLeftSliderValueLabel: UILabel?
    private var topRightSlider: UISlider?
    private var topRightSliderValueLabel: UILabel?
    private var bottomLeftSlider: UISlider?
    private var bottomLeftSliderValueLabel: UILabel?
    private var bottomRightSlider: UISlider?
    private var bottomRightSliderValueLabel: UILabel?
    
    private var applyButton: ApplyFilterButton?
}

extension FiltersScenePopUpMenu {
    private struct Constants {
        static let elementsLayerCornerRadiusValue: CGFloat = 8.0
        static let showHideButtonTrailingOffset: CGFloat = 50.0
        static let showHideButtonWidthHeightValue: CGFloat = 35.0
        static let applyButtonHeightValue: CGFloat = 50.0
        static let elementsViewsStackHeightValue: CGFloat = AppCore.shared.uiLayer.device.screenSize.height / 6
        static let elementsPaddingValue: CGFloat = 10.0
        static let slidersInitialValue: Float = 0.0
    }
}
