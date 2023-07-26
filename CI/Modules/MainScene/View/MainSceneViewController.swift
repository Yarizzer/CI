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
        
        interactor?.makeRequest(requestType: .viewIsReady)
    }
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    private var provider: TableViewProviderType?
    
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
                writeLog(type: .info, message: "Cell with index \(indexPath.row) did tapped")
//                AppCore.shared.uiLayer.device.generateFeedback(with: .success)
//                self?.interactor?.makeRequest(requestType: .itemSelected(withIndex: indexPath.row))
            }
		}
	}
}

extension MainSceneViewController {
	private struct Constants {
		
	}
}
