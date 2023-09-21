//
//  TestSceneInteractorContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 20.09.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol TestSceneInteractable: AnyObject {
	func makeRequest(requestType: TestSceneInteractorRequest.RequestType)
}

struct TestSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case routeBack
	}
}
