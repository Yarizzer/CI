//
//  MainSceneInteractorService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractorServiceType{
    func getItem(with index: Int) -> MainSceneCellViewModelType
}

class MainSceneInteractorService {
	init(withModel model: MainSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: MainSceneViewModelType
}

extension MainSceneInteractorService: MainSceneInteractorServiceType {
    func getItem(with index: Int) -> MainSceneCellViewModelType { viewModel.getCellViewModel(with: index) }
}
