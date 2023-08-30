//
//  MainSceneViewController.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class MainSceneViewController: BaseViewController<MainSceneInteractable> {
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
      sSelf.interactor?.makeRequest(requestType: .viewIsReady)
    })
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
    
    tableView.alpha = Constants.alpha.min
  }
  
  private func setup() {
    topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
    
    tableView.tableFooterView = UIView(frame: .zero)
    
    interactor?.makeRequest(requestType: .initialSetup)
  }
  
  private var provider: TableViewProviderType?
  
  @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
  @IBOutlet private weak var tableView: UITableView!
}

extension MainSceneViewController: MainSceneViewControllerType {
  func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType) {
    switch viewModelDataType {
    case .initialSetup(let model):
      print("\(self) \(#function) with model instance \(model)")
    case .setupProvider(let model):
      guard let presenterModel = model as? TableViewProviderViewModel else { return }
      
      provider = TableViewProvider(for: self.tableView, with: presenterModel)
      provider?.registerCells([MainSceneFiltersCell.self])
      
      provider?.onConfigureCell = { [weak self] indexPath in
        guard let provider = self?.provider else { return UITableViewCell() }
        
        let cellModel = model.getCellViewModel(with: indexPath.row)
        
        switch cellModel.type {
        case .filters:
          let tableViewCell: MainSceneFiltersCell = provider.dequeueReusableCell(for: indexPath)
          
          tableViewCell.setup(with: cellModel)
          
          return tableViewCell
        }
      }
      
      provider?.onSelectCell = extractSelf { sSelf, indexPath in
        AppCore.shared.uiLayer.device.generateFeedback(with: .success)
        sSelf.interactor?.makeRequest(requestType: .itemSelected(withIndex: indexPath.row))
      }
    case .reloadProvider:
      UIView.animate(withDuration: Constants.tableViewAD / 2, delay: 0, options: [.allowUserInteraction], animations: extractSelf { sSelf in
        sSelf.tableView.alpha = Constants.alpha.min
      }, completion: extractSelf { sSelf, _ in
        sSelf.provider?.reloadData()
        UIView.animate(withDuration: Constants.tableViewAD / 2, delay: 0, options: [.allowUserInteraction], animations: sSelf.extractSelf { sSelf in
          sSelf.tableView.alpha = Constants.alpha.max
        })
      })
    }
  }
}

extension MainSceneViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    BlurTransitionAnimator()
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    BlurTransitionAnimator()
  }
}

extension MainSceneViewController {
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
