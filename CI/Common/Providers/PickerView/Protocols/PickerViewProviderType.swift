//
//  PickerViewProviderType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

protocol PickerViewProviderType {
    var onConfigureView: ((Int, Int) -> UIView)? { get set }
    var didSelectRow: ((Int) -> ())? { get set }
    func reloadData()
}
