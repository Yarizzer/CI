//
//  AppUILayerDeviceWorkerType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import Foundation

enum FeedbackType {
    case success, failure
}

protocol AppUILayerDeviceWorkerType {
    var screenSize: CGRect { get }
    var topPaddingValue: CGFloat { get }
    var bottomPaddingValue: CGFloat { get }
    
    func generateFeedback(with type: FeedbackType)
    func vibrate()
}
