//
//  FiltersScenePopUpMenuViewModelType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol FiltersScenePopUpMenuViewModelType {
    //Publisher
    var needToHide: Publisher<Bool?> { get }
    var selectedItemDidChanged: Publisher<String?> { get }
    
    func updateNeedToHideValue(with data: Bool)
    func updateSelectItemIndex(with index: Int)
    func updateSliderValue(for sliderType: FiltersScenePopUpMenuSliders)
    
    func applyFilters()
    func getItemModel(for row: Int, component: Int) -> PickerViewCIFilterItemViewModelType
}
