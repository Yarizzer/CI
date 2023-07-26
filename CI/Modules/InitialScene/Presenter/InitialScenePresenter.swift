//
//  InitialScenePresenter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class InitialScenePresenter {
	init(for view: InitialSceneViewControllerType, service: InitialScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: InitialSceneViewControllerType?
	private let service: InitialScenePresenterServiceType
}

extension InitialScenePresenter: InitialScenePresentable {
	func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .drainView: viewController = nil
		}
	}
}
