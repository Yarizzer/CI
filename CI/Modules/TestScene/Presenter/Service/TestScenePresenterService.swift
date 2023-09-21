//
//  TestScenePresenterService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestScenePresenterServiceType: AnyObject {
	var model: TestSceneViewModelType { get }
}

final class TestScenePresenterService {
	init(withModel model: TestSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: TestSceneViewModelType
}

extension TestScenePresenterService: TestScenePresenterServiceType {
	var model: TestSceneViewModelType { return viewModel }
}
