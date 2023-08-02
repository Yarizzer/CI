//
//  FiltersSceneViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import Foundation

protocol FiltersSceneViewModelType {
    //Subscription
    func setupSubscription()
    //MARK: - Publishers
    var newDataDidFetched: Publisher<Bool?> { get }
    var needToHidePopUpMenu: Publisher<Bool?> { get }
    var selectedItemDidChanged: Publisher<String?> { get }
    
    //MARK: - Prop's
    var initialSceneTitle: String { get }
    var imageData: Data? { get }
    //MARK: - Functions
//    var initialImageName: String { get }
    func getPopUpMenuViewModel() -> FiltersScenePopUpMenuViewModelType
}

class FiltersSceneViewModel: NSObject {
    //Subscription
    func setupSubscription() {
        data = AppCore.shared.ciProcessorLayer.source
        AppCore.shared.ciProcessorLayer.output.subscribe(self, closure: extractSelf { sSelf, data in
            sSelf.data = data.newValue
        })
    }
    //MARK: - Publishers
    var newDataDidFetched: Publisher<Bool?> = Publisher(nil)
    var needToHidePopUpMenu: Publisher<Bool?> = Publisher(nil)
    var selectedItemDidChanged: Publisher<String?> = Publisher(nil)
    
    private var data: Data? {
        didSet {
            newDataDidFetched.value = true
        }
    }
}

extension FiltersSceneViewModel: FiltersSceneViewModelType {
    //MARK: - Prop's
//    var initialImageName: String { Constants.initialImageNameValue }
    var initialSceneTitle: String { Constants.initialTitleValue }
    var imageData: Data? { data }
    //MARK: - Functions
    func getPopUpMenuViewModel() -> FiltersScenePopUpMenuViewModelType {
        let model = FiltersScenePopUpMenuViewModel()
        
        model.needToHide.subscribe(self, closure: extractSelf { sSelf, data in
            sSelf.needToHidePopUpMenu.value = data.newValue
        })
        
        model.selectedItemDidChanged.subscribe(self, closure: extractSelf { sSelf, data in
            sSelf.selectedItemDidChanged.value = data.newValue
        })
        
        return model
    }
}

extension FiltersSceneViewModel {
    private struct Constants {
        static let initialTitleValue = ""
    }
}
