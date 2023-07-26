//
//  InitialSceneInteractorService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractorServiceType{ }

class InitialSceneInteractorService {
	init(withModel model: InitialSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: InitialSceneViewModelType
}

extension InitialSceneInteractorService: InitialSceneInteractorServiceType { }
