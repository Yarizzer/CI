//
//  InitialSceneViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneViewModelType {
    var imageName: String { get }
}

class InitialSceneViewModel { }

extension InitialSceneViewModel: InitialSceneViewModelType {
    var imageName: String { Constants.mainImageValue }
}

extension InitialSceneViewModel {
    private struct Constants {
        static let mainImageValue = "Flower"
    }
}
