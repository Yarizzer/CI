//
//  FiltersScenePresenterService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol FiltersScenePresenterServiceType{
	var model: FiltersSceneViewModelType { get }
}

class FiltersScenePresenterService {
	init(withModel model: FiltersSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: FiltersSceneViewModelType
}

extension FiltersScenePresenterService: FiltersScenePresenterServiceType {
	var model: FiltersSceneViewModelType { return viewModel }
}
