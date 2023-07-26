//
//  AppCore.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

class AppCore {
    static let shared = AppCore()
    
    private init() {
        self.appUIL = AppUILayer()
    }
    
    private let appUIL: AppUILayerType
}

extension AppCore: AppCoreSessionType {}

extension AppCore: AppCoreUILayerType {
    var uiLayer: AppUILayerType { appUIL }
}
