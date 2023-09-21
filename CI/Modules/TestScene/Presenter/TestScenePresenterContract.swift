//
//  TestScenePresenterContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestScenePresentable: AnyObject {
    func response(responseType: TestScenePresenterResponse.TestSceneResponseType)
}

struct TestScenePresenterResponse {
	enum TestSceneResponseType {
		case initialSetup
		case drainView
	}
}
