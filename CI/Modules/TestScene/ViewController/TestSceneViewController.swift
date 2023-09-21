//
//  TestSceneViewController.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

final class TestSceneViewController: BaseViewController<TestSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layoutIfNeeded()
        UIView.animate(withDuration: Constants.initialAD, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: extractSelf { sSelf in
            sSelf.topPaddingConstraint.constant -= Constants.topConstraintExtraValue
            sSelf.view.layoutIfNeeded()
        }, completion: extractSelf { sSelf, _ in
            sSelf.backButton.appear()
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
    }
	
	private func setup() {
        topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    @IBAction private func backButtonAction(_ sender: BackButton) {
      interactor?.makeRequest(requestType: .routeBack)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var backButton: BackButton!
    @IBOutlet private weak var sceneTitle: UILabel!
}

extension TestSceneViewController: TestSceneViewControllerType {
	func update(viewModelDataType: TestSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.initialSceneTitle
		}
	}
}

extension TestSceneViewController {
	private struct Constants {
        //Alpha
        static let alpha: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        //Animation duration
        static let initialAD: Double = 0.5
        static let tableViewAD: Double = 1
        //Constraints
        static let topConstraintExtraValue: CGFloat = 30.0
	}
}
