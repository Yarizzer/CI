//
//  TestScenePresenter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

final class TestScenePresenter {
	init(for view: TestSceneViewControllerType, service: TestScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: TestSceneViewControllerType?
	private let service: TestScenePresenterServiceType
}

extension TestScenePresenter: TestScenePresentable {
	func response(responseType: TestScenePresenterResponse.TestSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
        case .viewIsReady: viewController?.update(viewModelDataType: .updateTestView(with: model))
		case .drainView: viewController = nil
		}
	}
}
