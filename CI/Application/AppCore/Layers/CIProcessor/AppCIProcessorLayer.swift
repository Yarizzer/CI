//
//  AppCIProcessorLayer.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

import UIKit

class AppCIProcessorLayer {
    init() {
        //Source
//        var data = [PickerViewItemViewModelType]()
//
//        data.append(PickerViewItemRegularViewModel(with: "CIHueAdjust"))
//        data.append(PickerViewItemRegularViewModel(with: "CIToneCurve"))
//        data.append(PickerViewItemRegularViewModel(with: "CIColorInvert"))
//        data.append(PickerViewItemRegularViewModel(with: "CIPhotoEffectMono"))
//        data.append(PickerViewItemRegularViewModel(with: "CISepiaTone"))
//        data.append(PickerViewItemRegularViewModel(with: "CIDivideBlendMode"))
//        data.append(PickerViewItemRegularViewModel(with: "CILuminosityBlendMode"))
//        data.append(PickerViewItemRegularViewModel(with: "CISourceAtopCompositing"))
//        data.append(PickerViewItemRegularViewModel(with: "CIBumpDistortion"))
//        data.append(PickerViewItemRegularViewModel(with: "CISplashDistortion"))
//        data.append(PickerViewItemRegularViewModel(with: "CIDroste"))
//        data.append(PickerViewItemRegularViewModel(with: "CICrop"))
//        data.append(PickerViewItemRegularViewModel(with: "CIStraightenFilter"))
//        data.append(PickerViewItemRegularViewModel(with: "CIGaussianGradient"))
//        data.append(PickerViewItemRegularViewModel(with: "CILinearGradient"))
//        data.append(PickerViewItemRegularViewModel(with: "CIDotScreen"))
//        data.append(PickerViewItemRegularViewModel(with: "CIBloom"))
//        data.append(PickerViewItemRegularViewModel(with: "CILineOverlay"))
//        data.append(PickerViewItemRegularViewModel(with: "CIPixellate"))
//        data.append(PickerViewItemRegularViewModel(with: "CIKaleidoscope"))
//        data.append(PickerViewItemRegularViewModel(with: "CITriangleTile"))
//        data.append(PickerViewItemRegularViewModel(with: "CIDissolveTransition"))
//        data.append(PickerViewItemRegularViewModel(with: "CIPageCurlTransition"))
        
        var data = [ProcessorFilterItem]()
        data.append(ProcessorFilterItem(key: "CIBoxBlur", type: .boxBlur, title: "Box blur"))
        data.append(ProcessorFilterItem(key: "CIZoomBlur", type: .zoomBlur, title: "Zoom blur"))
        data.append(ProcessorFilterItem(key: "CIColorMatrix", type: .colorMatrix, title: "Color matrix"))
        data.append(ProcessorFilterItem(key: "CIHueAdjust", type: .hueAdjust, title: "Hue adjust"))
        data.append(ProcessorFilterItem(key: "CISepiaTone", type: .sepia, title: "Sepia tone"))
        
        self.filterItems = data
        
        guard let image = UIImage(named: Constants.initialImageName) else { return }
        
        self.sourceData = image.pngData()
    }
    //Publishers
    var output: Publisher<Data?> = Publisher(nil)
    //Prop's
    private var sourceData: Data? {
        didSet {
            output.value = sourceData
        }
    }
    
    private var filterItems: [ProcessorFilterItem]
}

extension AppCIProcessorLayer: AppCIProcessorLayerType {
    //Prop's
    var source: Data? { sourceData }
    var filters: [ProcessorFilterItem] { filterItems }
    
    func process(for filter: ProcessorFilterItem, with demands: ProcessorFilterDemands) {
        guard let data = source, let ciImage = CIImage(data: data) else { return }
        
        
        switch filter.type {
        case .boxBlur:
            let params: [String: Any] = [kCIInputImageKey: ciImage,
                                         kCIInputRadiusKey: demands.topLeft * 100]
            
            let filter = CIFilter(name: filter.key, parameters: params)
            
            guard let outputImage = filter?.outputImage else { return }
            
            output.value = UIImage(ciImage: outputImage).pngData()
        case .zoomBlur:
            let centerVector = CIVector(x: AppCore.shared.uiLayer.device.screenSize.width / CGFloat(demands.topLeft),
                                        y: AppCore.shared.uiLayer.device.screenSize.height / CGFloat(demands.topRight))
            
            let params: [String: Any] = [kCIInputImageKey: ciImage,
                                         kCIInputCenterKey: centerVector,
                                         kCIInputAmountKey: demands.bottomLeft * 100]
            
            let filter = CIFilter(name: filter.key, parameters: params)
            
            guard let outputImage = filter?.outputImage else { return }
            
            output.value = UIImage(ciImage: outputImage).pngData()
        case .colorMatrix:
            writeLog(type: .info, message: "Plug")
        case .hueAdjust:
            writeLog(type: .info, message: "Plug")
        case .sepia:
            let params: [String : Any] = [kCIInputImageKey : ciImage,
                                      kCIInputIntensityKey : demands.topLeft]
            
            let filter = CIFilter(name: filter.key, parameters: params)
            
            guard let outputImage = filter?.outputImage else { return }
            
            output.value = UIImage(ciImage: outputImage).pngData()
        }
    }
}

extension AppCIProcessorLayer {
    private struct Constants {
        static let initialImageName = "Flower"
        static let compressionQuality: CGFloat = 1.0
    }
}
