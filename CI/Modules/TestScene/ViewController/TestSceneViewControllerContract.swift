//
//  TestSceneViewControllerContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestSceneViewControllerType: AnyObject {
	func update(viewModelDataType: TestSceneViewControllerViewModel.ViewModelDataType)
}

struct TestSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: TestSceneViewModelType)
	}
}
