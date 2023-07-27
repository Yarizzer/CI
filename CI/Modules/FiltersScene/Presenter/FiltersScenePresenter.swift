//
//  FiltersScenePresenter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class FiltersScenePresenter {
	init(for view: FiltersSceneViewControllerType, service: FiltersScenePresenterServiceType) {
		self.viewController = view
		self.service = service
        
        service.model.needToHidePopUpMenu.subscribe(self) { [weak self] data in
            self?.viewController?.update(viewModelDataType: .needToHidePopUpMenu(withValue: data.newValue))
        }
	}
	
	private var viewController: FiltersSceneViewControllerType?
	private let service: FiltersScenePresenterServiceType
}

extension FiltersScenePresenter: FiltersScenePresentable {
	func response(responseType: FiltersScenePresenterResponse.FiltersSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .drainView: viewController = nil
		}
	}
}
