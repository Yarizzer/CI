//
//  FiltersScenePopUpMenuViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

class FiltersScenePopUpMenuViewModel {
    init() {
        var data = [PickerViewItemViewModelType]()
        data.append(PickerViewItemRegularViewModel(with: "CIBoxBlur"))
        data.append(PickerViewItemRegularViewModel(with: "CIZoomBlur"))
        data.append(PickerViewItemRegularViewModel(with: "CIColorMatrix"))
        data.append(PickerViewItemRegularViewModel(with: "CIHueAdjust"))
        data.append(PickerViewItemRegularViewModel(with: "CIToneCurve"))
        data.append(PickerViewItemRegularViewModel(with: "CIColorInvert"))
        data.append(PickerViewItemRegularViewModel(with: "CIPhotoEffectMono"))
        data.append(PickerViewItemRegularViewModel(with: "CISepiaTone"))
        data.append(PickerViewItemRegularViewModel(with: "CIDivideBlendMode"))
        data.append(PickerViewItemRegularViewModel(with: "CILuminosityBlendMode"))
        data.append(PickerViewItemRegularViewModel(with: "CISourceAtopCompositing"))
        data.append(PickerViewItemRegularViewModel(with: "CIBumpDistortion"))
        data.append(PickerViewItemRegularViewModel(with: "CISplashDistortion"))
        data.append(PickerViewItemRegularViewModel(with: "CIDroste"))
        data.append(PickerViewItemRegularViewModel(with: "CICrop"))
        data.append(PickerViewItemRegularViewModel(with: "CIStraightenFilter"))
        data.append(PickerViewItemRegularViewModel(with: "CIGaussianGradient"))
        data.append(PickerViewItemRegularViewModel(with: "CILinearGradient"))
        data.append(PickerViewItemRegularViewModel(with: "CIDotScreen"))
        data.append(PickerViewItemRegularViewModel(with: "CIBloom"))
        data.append(PickerViewItemRegularViewModel(with: "CILineOverlay"))
        data.append(PickerViewItemRegularViewModel(with: "CIPixellate"))
        data.append(PickerViewItemRegularViewModel(with: "CIKaleidoscope"))
        data.append(PickerViewItemRegularViewModel(with: "CITriangleTile"))
        data.append(PickerViewItemRegularViewModel(with: "CIDissolveTransition"))
        data.append(PickerViewItemRegularViewModel(with: "CIPageCurlTransition"))
        
        self.items = data
        self.selectedItemIndex = 0
    }
    //Publishers
    var needToHide: Publisher<Bool?> = Publisher(nil)
    var selectedItemDidChanged: Publisher<String?> = Publisher(nil)
    
    private var items: [PickerViewItemViewModelType]
    private var selectedItemIndex: Int {
        didSet {
            selectedItemDidChanged.value = (items[selectedItemIndex] as? PickerViewItemRegularViewModel)?.contentData
        }
    }
}

extension FiltersScenePopUpMenuViewModel: FiltersScenePopUpMenuViewModelType {
    func updateNeedToShowValue(with data: Bool) {
        needToHide.value = data
    }
    
    func updateSelectItemIndex(with index: Int) {
        selectedItemIndex = index
    }
    
    func applyFilters() {
        
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
        static let rowHeightValue: Float = 50.0
        static let rowWidthValue: Float = Float(AppCore.shared.uiLayer.device.screenSize.width - 20.0)
    }
}
