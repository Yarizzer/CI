//
//  MainSceneViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneViewModelType: AnyObject {
    func getCellViewModel(with index: Int) -> MainSceneCellViewModelType
}

class MainSceneViewModel {
    init() {
        var data = [MainSceneCellViewModelType]()
        data.append(MainSceneFiltersCellViewModel())
        data.append(MainSceneTestCellViewModel())
        
        self.cellItemsData = data
    }
    
    private var cellItemsData: [MainSceneCellViewModelType]
}

extension MainSceneViewModel: MainSceneViewModelType {
    func getCellViewModel(with index: Int) -> MainSceneCellViewModelType {
        cellItemsData[index]
    }
}

extension MainSceneViewModel: TableViewProviderViewModel {
    var numberOfTableSections: Int { Constants.numberOfSections }
    
    func numberOfTableRowsInSection(_ section: Int) -> Int { cellItemsData.count }
    func heightForRow(atIndex index: Int) -> Float { Constants.rowHeightValue }
}

extension MainSceneViewModel {
    private struct Constants {
        static let numberOfSections: Int = 1
        static let rowHeightValue: Float = 80.0
    }
}
