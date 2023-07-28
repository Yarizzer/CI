//
//  AppCIProcessorLayer.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

import Foundation

class AppCIProcessorLayer {
    
    
    var output: Publisher<Data?> = Publisher(nil)
}

extension AppCIProcessorLayer: AppCIProcessorLayerType {
    
}
