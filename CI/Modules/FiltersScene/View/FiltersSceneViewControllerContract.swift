//
//  FiltersSceneViewControllerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol FiltersSceneViewControllerType {
	func update(viewModelDataType: FiltersSceneViewControllerViewModel.ViewModelDataType)
}

struct FiltersSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: FiltersSceneViewModelType)
	}
}
