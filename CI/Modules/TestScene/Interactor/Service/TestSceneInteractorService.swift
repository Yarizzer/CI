//
//  TestSceneInteractorService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestSceneInteractorServiceType: AnyObject { }

final class TestSceneInteractorService {
	init(withModel model: TestSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: TestSceneViewModelType
}

extension TestSceneInteractorService: TestSceneInteractorServiceType { }
