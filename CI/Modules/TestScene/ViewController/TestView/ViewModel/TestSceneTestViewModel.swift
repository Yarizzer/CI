//
//  TestSceneTestViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 21.09.2023.
//

protocol TestSceneTestViewModelType: AnyObject {
    var textData: String { get }
    var imageNameValue: String { get }
}

class TestSceneTestViewModel { }

extension TestSceneTestViewModel: TestSceneTestViewModelType {
    var textData: String { Constants.textData }
    var imageNameValue: String { Constants.imageName }
}

extension TestSceneTestViewModel {
    private struct Constants {
        static let textData = "Some text data"
        static let imageName = "Flower"
    }
}
