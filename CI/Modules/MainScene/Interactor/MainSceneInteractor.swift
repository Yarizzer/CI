//
//  MainSceneInteractor.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class MainSceneInteractor {
	init(withRouter router: MainSceneRoutable, presenter: MainScenePresentable, service: MainSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: MainSceneRoutable
	private let presenter: MainScenePresentable
	private let service: MainSceneInteractorServiceType
}

extension MainSceneInteractor: MainSceneInteractable {
	func makeRequest(requestType: MainSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
		}
	}
}