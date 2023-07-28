//
//  FiltersSceneInteractorService.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol FiltersSceneInteractorServiceType{
    func setupSubscription()
}

class FiltersSceneInteractorService {
	init(withModel model: FiltersSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: FiltersSceneViewModelType
}

extension FiltersSceneInteractorService: FiltersSceneInteractorServiceType {
    func setupSubscription() {
        viewModel.setupSubscription()
    }
}
