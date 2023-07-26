//
//  AppCoreContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol AppCoreSessionType {
    func prepareSession(completion: @escaping (Bool) -> ())
    func openSession()
    func closeSession()
}

protocol AppCoreUILayerType {
    var uiLayer: AppUILayerType { get }
}
