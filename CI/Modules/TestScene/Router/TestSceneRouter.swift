//
//  TestSceneRouter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol TestSceneRoutable: AnyObject {
	static func assembly() -> UIViewController
	func routeTo(scene type: TestSceneRoutableContractData.TestSceneRoutableSceneType)
    func dismiss()
}

final class TestSceneRouter {
	private func prepareDestinationScene(with type: TestSceneRoutableContractData.TestSceneRoutableSceneType) -> UIViewController {
		switch type {
		case .testScene: print("\(self) \(#function) msg: 'Test scene'")
		}
		
		return UIViewController()
	}
	
	private weak var view: TestSceneViewController?
}

extension TestSceneRouter: TestSceneRoutable {
	static func assembly() -> UIViewController {
		let router = TestSceneRouter()
		let vc                  = TestSceneViewController(nibName: String(describing: TestSceneViewController.self), bundle: Bundle.main)
		let viewModel           = TestSceneViewModel()
		let presenterService    = TestScenePresenterService(withModel: viewModel)
		let presenter           = TestScenePresenter(for: vc, service: presenterService)
		let interactorService   = TestSceneInteractorService(withModel: viewModel)
		let interactor          = TestSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
        vc.interactor = interactor
		router.view = vc
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: TestSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: TestSceneRoutableContractData.TestSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
        #warning("uncomment if need to implement custom scene transitioning")
//		vc.modalPresentationStyle = .currentContext
//		vc.transitioningDelegate = view
		self.view?.present(vc, animated: true)
	}
    
    func dismiss() {
        view?.dismiss(animated: true, completion: nil)
    }
}
