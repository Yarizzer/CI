//
//  FiltersScenePopUpMenuViewModelContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol FiltersScenePopUpMenuViewModelType {
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType
}
