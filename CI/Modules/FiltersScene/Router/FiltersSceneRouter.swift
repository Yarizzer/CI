//
//  FiltersSceneRouter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol FiltersSceneRoutable {
	static func assembly() -> UIViewController
	func routeTo(scene type: FiltersSceneRoutableContractData.FiltersSceneRoutableSceneType)
}

class FiltersSceneRouter {
	private func prepareDestinationScene(with type: FiltersSceneRoutableContractData.FiltersSceneRoutableSceneType) -> UIViewController {
		switch type {
		case .testScene: print("\(self) \(#function) msg: 'Test scene'")
		}
		
		return UIViewController()
	}
	
	private weak var view: FiltersSceneViewController?
}

extension FiltersSceneRouter: FiltersSceneRoutable {
	static func assembly() -> UIViewController {
		let router = FiltersSceneRouter()
		let vc                  = FiltersSceneViewController(nibName: String(describing: FiltersSceneViewController.self), bundle: Bundle.main)
		let viewModel           = FiltersSceneViewModel()
		let presenterService    = FiltersScenePresenterService(withModel: viewModel)
		let presenter           = FiltersScenePresenter(for: vc, service: presenterService)
		let interactorService   = FiltersSceneInteractorService(withModel: viewModel)
		let interactor          = FiltersSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
        vc.interactor = interactor
		router.view = vc
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: FiltersSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: FiltersSceneRoutableContractData.FiltersSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
        #warning("uncomment if need to implement custom scene transitioning")
//		vc.modalPresentationStyle = .currentContext
//		vc.transitioningDelegate = view
		self.view?.present(vc, animated: true)
	}
}
