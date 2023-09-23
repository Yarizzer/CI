//
//  BubbleTransitionAnimator.swift
//  CI
//
//  Created by Yaroslav Abaturov on 23.09.2023.
//

import UIKit

class BubbleTransitionAnimator: NSObject {
    private func runTransitioning(using context: UIViewControllerContextTransitioning) {
        let container = context.containerView
        
        guard let currentView = context.view(forKey: .from), let destinationView = context.view(forKey: .to) else {
            context.completeTransition(false)
            return
        }
        
        let backgroundImageView = prepareBackgroundView()
    }
    
    private func prepareBackgroundView() -> UIImageView {
        let backgroundImageView = UIImageView()
        backgroundImageView.animationImages = []
        backgroundImageView.animationDuration = Constants.animationDuration
        backgroundImageView.animationRepeatCount = Constants.backgroundImageAnimationRepeatCount
        
        return backgroundImageView
    }
}

extension BubbleTransitionAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        runTransitioning(using: transitionContext)
    }
}

extension BubbleTransitionAnimator {
    private struct Constants {
        //Alpha values
        static let alphaValues: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        //Animation duration
        static let animationDuration: Double = 10.0
        static let backgroundImageAnimationRepeatCount = 1
        static let bubblesImageAnimationRepeatCount = 1
    }
}
