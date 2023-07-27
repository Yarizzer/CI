//
//  InitialSceneViewController.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        interactor?.makeRequest(requestType: .viewIsReady)
    }
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
        
        mainImage.alpha = Constants.alphaValues.min
	}
    
    @IBOutlet private weak var mainImage: UIImageView!
}

extension InitialSceneViewController: InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            guard let image = UIImage(named: model.imageName) else { return }
            
            mainImage.image = image
            
        case .appearElements:
            UIView.animate(withDuration: Constants.initialAD, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: extractSelf { sSelf in
                sSelf.mainImage.alpha = Constants.alphaValues.max
            }, completion: extractSelf { sSelf, finished in
                sSelf.interactor?.makeRequest(requestType: .routeToMainScene)
            })
		}
	}
}

extension InitialSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        BlurTransitionAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        BlurTransitionAnimator()
    }
}

extension InitialSceneViewController {
	private struct Constants {
        static let alphaValues: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        //AnimationDuration
        static let initialAD: Double = 1.0
	}
}
