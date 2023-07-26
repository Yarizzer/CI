//
//  InitialSceneViewControllerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType)
}

struct InitialSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: InitialSceneViewModelType)
	}
}
