//
//  PickerViewProviderViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol PickerViewProviderViewModel: AnyObject {
    var numberOfComponents: Int { get }
    func numberOfRowsIn(component: Int) -> Int
    func rowHeight(for component: Int) -> Float
    func rowWidth(for component: Int) -> Float
}
