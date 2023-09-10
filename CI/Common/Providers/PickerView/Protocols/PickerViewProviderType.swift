//
//  PickerViewProviderType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

protocol PickerViewProviderType: AnyObject {
    var onConfigureView: ((Int, Int) -> UIView)? { get set }
    var didSelectRow: ((Int) -> ())? { get set }
    func reloadData()
}
