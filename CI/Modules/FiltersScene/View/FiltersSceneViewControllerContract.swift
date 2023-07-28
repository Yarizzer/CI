//
//  FiltersSceneViewControllerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import Foundation

protocol FiltersSceneViewControllerType {
	func update(viewModelDataType: FiltersSceneViewControllerViewModel.ViewModelDataType)
}

struct FiltersSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: FiltersSceneViewModelType)
        case needToHidePopUpMenu(withValue: Bool?)
        case updateTitle(with: String?)
        case updateImage(with: Data?)
	}
}
