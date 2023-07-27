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
    //Publishers
    var needToHide: Publisher<Bool?> = Publisher(nil)
    
    private var items: [PickerViewItemViewModelType]
}

extension FiltersScenePopUpMenuViewModel: FiltersScenePopUpMenuViewModelType {
    func updateNeedToShowValue(with data: Bool) {
        needToHide.value = data
    }
    
    func getItemModel(for row: Int, component: Int) -> PickerViewItemViewModelType {
        items[row]
    }
}

extension FiltersScenePopUpMenuViewModel: PickerViewProviderViewModel {
    var numberOfComponents: Int { Constants.numberOfComponents }
    
    func numberOfRowsIn(component: Int) -> Int { items.count }
    func rowHeight(for component: Int) -> Float { Constants.rowHeightValue }
    func rowWidth(for component: Int) -> Float { Constants.rowWidthValue }
}

extension FiltersScenePopUpMenuViewModel {
    private struct Constants {
        //PickerViewProviderViewModel
        static let numberOfComponents = 1
        static let rowHeightValue: Float = 40.0
        static let rowWidthValue: Float = Float(AppCore.shared.uiLayer.device.screenSize.width - 20.0)
    }
}
