//
//  FiltersSceneViewController.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class FiltersSceneViewController: BaseViewController<FiltersSceneInteractable> {
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
      
      UIView.animate(withDuration: Constants.initialAD, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: [.curveEaseOut, .allowUserInteraction], animations: sSelf.extractSelf { sSelf in
        sSelf.popUpMenuTopPaddingConstraint.constant = Constants.popUpTopConstraintDefaultValue
        sSelf.view.layoutIfNeeded()
      }, completion: sSelf.extractSelf { sSelf, _ in
        sSelf.interactor?.makeRequest(requestType: .viewIsReady)
      })
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
  @IBOutlet private weak var popUpMenuTopPaddingConstraint: NSLayoutConstraint!
  
  @IBOutlet private weak var backButton: BackButton!
  @IBOutlet private weak var sceneTitle: UILabel!
  @IBOutlet private weak var popUpMenu: FiltersScenePopUpMenu!
  @IBOutlet private weak var imageView: UIImageView!
  
}

extension FiltersSceneViewController: FiltersSceneViewControllerType {
  func update(viewModelDataType: FiltersSceneViewControllerViewModel.ViewModelDataType) {
    switch viewModelDataType {
    case .initialSetup(let model):
      sceneTitle.text = model.initialSceneTitle
      
      popUpMenu.setup(with: model.getPopUpMenuViewModel())
    case .needToHidePopUpMenu(let value):
      guard let value else { return }
      
      view.layoutIfNeeded()
      UIView.animate(withDuration: Constants.popUpMenuAD, delay: 0, options: [.curveEaseInOut, .allowUserInteraction],animations: extractSelf { sSelf in
        sSelf.popUpMenuTopPaddingConstraint.constant = value ? Constants.popUpTopConstraintDefaultValue : Constants.popUpTopConstraintExtendedValue
        
        sSelf.view.layoutIfNeeded()
      })
    case .updateTitle(let data):
      guard let data else { return }
      
      UIView.animate(withDuration: Constants.titleAD / 2, delay: 0, options: [.allowUserInteraction], animations: extractSelf { sSelf in
        sSelf.sceneTitle.alpha = Constants.alpha.min
      }, completion: extractSelf { sSelf, finished in
        sSelf.sceneTitle.text = data
        UIView.animate(withDuration: Constants.titleAD, delay: 0, options: [.allowUserInteraction], animations: sSelf.extractSelf { sSelf in
          sSelf.sceneTitle.alpha = Constants.alpha.max
        })
      })
    case .updateImage(let imageData):
      guard let imageData, let image = UIImage(data: imageData) else { return }
      
      UIView.animate(withDuration: Constants.imageUpdateAD / 2, delay: 0, options: [.allowUserInteraction], animations: extractSelf { sSelf in
        sSelf.imageView.alpha = Constants.alpha.min
      }, completion: extractSelf { sSelf, finished in
        sSelf.imageView.image = image
        UIView.animate(withDuration: Constants.imageUpdateAD, delay: 0, options: [.allowUserInteraction], animations: sSelf.extractSelf { sSelf in
          sSelf.imageView.alpha = Constants.alpha.max
        })
      })
    }
  }
}

extension FiltersSceneViewController {
  private struct Constants {
    //Alpha
    static let alpha: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
    //Animation duration
    static let initialAD: Double = 0.5
    static let popUpMenuAD: Double = 0.5
    static let titleAD: Double = 0.2
    static let imageUpdateAD: Double = 1.0
    //Constraints
    static let topConstraintExtraValue: CGFloat = 30.0
    static let popUpTopConstraintDefaultValue: CGFloat = -30.0
    static let popUpTopConstraintExtendedValue: CGFloat = -AppCore.shared.uiLayer.device.screenSize.height / 2
  }
}
