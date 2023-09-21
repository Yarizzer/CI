//
//  MainSceneFiltersCellViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//
protocol MainSceneFiltersCellViewModelType: AnyObject { }

class MainSceneFiltersCellViewModel { }

extension MainSceneFiltersCellViewModel: MainSceneFiltersCellViewModelType { }

extension MainSceneFiltersCellViewModel: MainSceneCellViewModelType {
    var type: MainSceneCellType { Constants.cellType }
    var title: String { Constants.titleValue }
}

extension MainSceneFiltersCellViewModel {
    private struct Constants {
        static let titleValue = "Filters scene"
        static let cellType: MainSceneCellType = .filters
    }
}
