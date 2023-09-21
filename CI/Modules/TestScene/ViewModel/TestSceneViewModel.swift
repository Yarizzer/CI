//
//  TestSceneViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestSceneViewModelType: AnyObject { 
    //MARK: - Prop's
    var initialSceneTitle: String { get }
    func getTestViewViewModel() -> TestSceneTestViewModelType
}

final class TestSceneViewModel { }

extension TestSceneViewModel: TestSceneViewModelType { 
    //MARK: - Prop's
    var initialSceneTitle: String { Constants.initialTitleValue }
    
    func getTestViewViewModel() -> TestSceneTestViewModelType {
        TestSceneTestViewModel()
    }
}

extension TestSceneViewModel {
    private struct Constants {
        static let initialTitleValue = "Test scene"
    }
}
