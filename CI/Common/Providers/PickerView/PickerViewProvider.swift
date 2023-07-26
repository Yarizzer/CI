//
//  PickerViewProvider.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class PickerViewProvider: NSObject, PickerViewProviderType {
    init(for pickerView: UIPickerView, with model: PickerViewProviderViewModel) {
        self.pickerView = pickerView
        self.viewModel = model
        
        super.init()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    var onConfigureView: ((Int, Int) -> UIView)?
    var didSelectRow: ((Int) -> ())?
    
    func reloadData() {
        pickerView.reloadAllComponents()
    }
    
    private let pickerView: UIPickerView
    private let viewModel: PickerViewProviderViewModel
}

extension PickerViewProvider: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberOfComponents
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRowsIn(component: component)
    }
}

extension PickerViewProvider: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        CGFloat(viewModel.rowHeight(for: component))
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        CGFloat(viewModel.rowWidth(for: component))
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        guard let onConfigureView else { fatalError("Need to init onConfigureView") }
        
        return onConfigureView(row, component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let didSelectRow else { return }
        
        didSelectRow(row)
    }
}
