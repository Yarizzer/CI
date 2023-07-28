//
//  AppCIProcessorLayerType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

import Foundation

protocol AppCIProcessorLayerType {
    var output: Publisher <Data?> { get }
}
