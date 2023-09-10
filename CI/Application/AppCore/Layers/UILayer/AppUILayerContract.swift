//
//  AppUILayerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol AppUILayerType: AnyObject {
    var style: AppUILayerStyleWorkerType { get }
    var device: AppUILayerDeviceWorkerType { get }
}
