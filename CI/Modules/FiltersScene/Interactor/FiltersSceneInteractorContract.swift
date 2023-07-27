//
//  FiltersSceneInteractorContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol FiltersSceneInteractable {
	func makeRequest(requestType: FiltersSceneInteractorRequest.RequestType)
}

struct FiltersSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case viewIsReady
        case routeBack
	}
}
