//
//  MainSceneViewControllerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneViewControllerType {
	func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType)
}

struct MainSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: MainSceneViewModelType)
        case setupProvider(with: MainSceneViewModelType)
        case reloadProvider
	}
}
