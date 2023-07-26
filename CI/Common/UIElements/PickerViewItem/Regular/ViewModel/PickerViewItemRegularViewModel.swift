//
//  PickerViewItemRegularViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol PickerViewItemRegularViewModelType {
    var contentData: String { get }
}

class PickerViewItemRegularViewModel {
    init(with data: String) {
        self.content = data
    }
    
    private var content: String
}

extension PickerViewItemRegularViewModel: PickerViewItemRegularViewModelType {
    var contentData: String { content }
}
