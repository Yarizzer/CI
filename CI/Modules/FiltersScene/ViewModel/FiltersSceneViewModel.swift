//
//  FiltersSceneViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import Foundation

protocol FiltersSceneViewModelType {
    //Publishers
    var needToHidePopUpMenu: Publisher<Bool?> { get }
    
    //Functions
    var initialImageName: String { get }
    func getPopUpMenuViewModel() -> FiltersScenePopUpMenuViewModelType
}

class FiltersSceneViewModel: NSObject {
    var needToHidePopUpMenu: Publisher<Bool?> = Publisher(nil)
}

extension FiltersSceneViewModel: FiltersSceneViewModelType {
    var initialImageName: String { Constants.initialImageNameValue }
    func getPopUpMenuViewModel() -> FiltersScenePopUpMenuViewModelType {
        let model = FiltersScenePopUpMenuViewModel()
        model.needToHide.subscribe(self, closure: extractSelf { sSelf, data in
            sSelf.needToHidePopUpMenu.value = data.newValue
        })
        
        return model
    }
}

extension FiltersSceneViewModel {
    private struct Constants {
        static let initialImageNameValue = "Flower"
    }
}
