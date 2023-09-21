//
//  TestSceneInteractor.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

final class TestSceneInteractor {
	init(withRouter router: TestSceneRoutable, presenter: TestScenePresentable, service: TestSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: TestSceneRoutable
	private let presenter: TestScenePresentable
	private let service: TestSceneInteractorServiceType
}

extension TestSceneInteractor: TestSceneInteractable {
	func makeRequest(requestType: TestSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
		}
	}
}
