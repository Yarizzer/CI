//
//  MainMenuViewModelType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol MainMenuViewModelType {
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType
}
