//
//  FiltersScenePopUpMenuViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

class FiltersScenePopUpMenuViewModel {
    init() {
        self.items = AppCore.shared.ciProcessorLayer.filters
        self.selectedItemIndex = 0
    }
    //Publishers
    var needToHide: Publisher<Bool?> = Publisher(nil)
    var selectedItemDidChanged: Publisher<String?> = Publisher(nil)
    
    private var items: [ProcessorFilterItem]
    private var selectedItemIndex: Int {
        didSet {
            selectedItemDidChanged.value = items[selectedItemIndex].title
        }
    }
}

extension FiltersScenePopUpMenuViewModel: FiltersScenePopUpMenuViewModelType {
    func updateNeedToHideValue(with data: Bool) {
        needToHide.value = data
    }
    
    func updateSelectItemIndex(with index: Int) {
        selectedItemIndex = index
    }
    
    func applyFilters() {
        AppCore.shared.ciProcessorLayer.process(with: items[selectedItemIndex])
    }
    
    func getItemModel(for row: Int, component: Int) -> PickerViewCIFilterItemViewModelType {
        PickerViewCIFilterItemViewModel(with: items[row])
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
        static let rowHeightValue: Float = 50.0
        static let rowWidthValue: Float = Float(AppCore.shared.uiLayer.device.screenSize.width - 20.0)
    }
}
