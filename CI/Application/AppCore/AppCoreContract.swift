//
//  AppCoreContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol AppCoreSessionType: AnyObject {
    func prepareSession(completion: @escaping (Bool) -> ())
    func openSession()
    func closeSession()
}

protocol AppCoreUILayerType: AnyObject {
    var uiLayer: AppUILayerType { get }
}

protocol AppCoreCIProcessorLayerType: AnyObject {
    var ciProcessorLayer: AppCIProcessorLayerType { get }
}
