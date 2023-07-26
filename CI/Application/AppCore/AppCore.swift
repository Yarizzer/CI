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

extension AppCore: AppCoreSessionType {
    func prepareSession(completion: @escaping (Bool) -> ()) {
        writeLog(type: .info, message: "Session prepared")
        completion(true)
    }
    func openSession() { writeLog(type: .info, message: "Session opened") }
    func closeSession() { writeLog(type: .info, message: "Session closed") }
}

extension AppCore: AppCoreUILayerType {
    var uiLayer: AppUILayerType { appUIL }
}
