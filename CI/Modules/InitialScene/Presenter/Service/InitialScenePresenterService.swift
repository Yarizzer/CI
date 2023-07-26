//
//  InitialScenePresenterService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresenterServiceType{
	var model: InitialSceneViewModelType { get }
}

class InitialScenePresenterService {
	init(withModel model: InitialSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: InitialSceneViewModelType
}

extension InitialScenePresenterService: InitialScenePresenterServiceType {
	var model: InitialSceneViewModelType { return viewModel }
}
