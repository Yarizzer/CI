//
//  PickerViewItemContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

enum PickerViewItemType {
    case regular
}

protocol PickerViewItemViewModelType {
    var type: PickerViewItemType { get }
}
