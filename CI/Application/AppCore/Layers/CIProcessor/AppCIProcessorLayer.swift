//
//  AppCIProcessorLayer.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

import UIKit

class AppCIProcessorLayer {
    
    //Publishers
    var output: Publisher<Data?> = Publisher(nil)
}

extension AppCIProcessorLayer: AppCIProcessorLayerType {
    //Prop's
    var initialData: Data? {
        guard let image = UIImage(named: Constants.initialImageName) else { return nil }
    
        return image.pngData()
    }
}

extension AppCIProcessorLayer {
    private struct Constants {
        static let initialImageName = "Flower"
        static let compressionQuality: CGFloat = 1.0
    }
}
