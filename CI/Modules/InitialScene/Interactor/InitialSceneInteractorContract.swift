//
//  InitialSceneInteractorContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractable {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType)
}

struct InitialSceneInteractorRequest {
	enum RequestType {
		case initialSetup
	}
}
