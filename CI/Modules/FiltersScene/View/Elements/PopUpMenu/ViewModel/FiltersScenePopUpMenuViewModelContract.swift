//
//  FiltersScenePopUpMenuViewModelContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol FiltersScenePopUpMenuViewModelType {
    //Publisher
    var needToHide: Publisher<Bool?> { get }
    
    func updateNeedToShowValue(with data: Bool)
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType
}
