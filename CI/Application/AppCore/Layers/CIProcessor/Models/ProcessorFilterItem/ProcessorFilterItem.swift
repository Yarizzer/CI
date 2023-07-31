//
//  ProcessorFilterItem.swift
//  CI
//
//  Created by Yaroslav Abaturov on 28.07.2023.
//

struct ProcessorFilterItem {
    let key: String
    let type: ProcessorFilterItemType
    let title: String
}

struct ProcessorFilterDemands {
    let topLeft: Float
    let topRight: Float
    let bottomLeft: Float
    let bottomRight: Float
}
