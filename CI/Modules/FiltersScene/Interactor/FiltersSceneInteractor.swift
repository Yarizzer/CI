//
//  FiltersSceneInteractor.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class FiltersSceneInteractor {
	init(withRouter router: FiltersSceneRoutable, presenter: FiltersScenePresentable, service: FiltersSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: FiltersSceneRoutable
	private let presenter: FiltersScenePresentable
	private let service: FiltersSceneInteractorServiceType
}

extension FiltersSceneInteractor: FiltersSceneInteractable {
	func makeRequest(requestType: FiltersSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .viewIsReady:
            #warning("fit smth here")
        case .routeBack: router.dismiss()
		}
	}
}
