//
//  PickerViewCIFilterItemViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol PickerViewCIFilterItemViewModelType {
    var title: String { get }
    var type: ProcessorFilterItemType { get }
}

class PickerViewCIFilterItemViewModel {
    init(with data: ProcessorFilterItem) {
        self.data = data
    }
    
    private var data: ProcessorFilterItem
}

extension PickerViewCIFilterItemViewModel: PickerViewCIFilterItemViewModelType {
    var title: String { data.title }
    var type: ProcessorFilterItemType { data.type }
}
