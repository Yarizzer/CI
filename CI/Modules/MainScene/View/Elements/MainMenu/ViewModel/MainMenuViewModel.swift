//
//  MainMenuViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

class MainMenuViewModel {
    init() {
        var data = [PickerViewItemViewModelType]()
        data.append(PickerViewItemRegularViewModel(with: "First"))
        data.append(PickerViewItemRegularViewModel(with: "Second"))
        data.append(PickerViewItemRegularViewModel(with: "Third"))
        
        self.items = data
    }
    
    private var items: [PickerViewItemViewModelType]
}

extension MainMenuViewModel: MainMenuViewModelType {
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType {
        items[row]
    }
}

extension MainMenuViewModel {
    private struct Constants { }
}
