//
//  MainSceneTestCellViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 21.09.2023.
//

protocol MainSceneTestCellViewModelType: AnyObject { }

class MainSceneTestCellViewModel { }

extension MainSceneTestCellViewModel: MainSceneTestCellViewModelType { }

extension MainSceneTestCellViewModel: MainSceneCellViewModelType {
    var type: MainSceneCellType { Constants.cellType }
    var title: String { Constants.titleValue }
}

extension MainSceneTestCellViewModel {
    private struct Constants {
        static let titleValue = "Test scene"
        static let cellType: MainSceneCellType = .testScene
    }
}
