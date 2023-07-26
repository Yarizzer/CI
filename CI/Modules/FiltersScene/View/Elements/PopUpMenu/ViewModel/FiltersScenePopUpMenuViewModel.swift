//
//  FiltersScenePopUpMenuViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

class FiltersScenePopUpMenuViewModel {
    init() {
        var data = [PickerViewItemViewModelType]()
        data.append(PickerViewItemRegularViewModel(with: "First"))
        data.append(PickerViewItemRegularViewModel(with: "Second"))
        data.append(PickerViewItemRegularViewModel(with: "Third"))
        
        self.items = data
    }
    
    private var items: [PickerViewItemViewModelType]
}

extension FiltersScenePopUpMenuViewModel: FiltersScenePopUpMenuViewModelType {
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType {
        items[row]
    }
}

extension FiltersScenePopUpMenuViewModel {
    private struct Constants { }
}
