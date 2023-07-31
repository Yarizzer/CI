//
//  AppCIProcessorLayerType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

import Foundation

protocol AppCIProcessorLayerType {
    //Publishers
    var output: Publisher <Data?> { get }
    //Prop's
    var source: Data? { get }
    var filters: [ProcessorFilterItem] { get }
    
    func process(for filter: ProcessorFilterItem, with demands: ProcessorFilterDemands)
}
