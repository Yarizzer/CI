//
//  FiltersScenePresenterContract.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol FiltersScenePresentable {
    func response(responseType: FiltersScenePresenterResponse.FiltersSceneResponseType)
}

struct FiltersScenePresenterResponse {
	enum FiltersSceneResponseType {
		case initialSetup
		case drainView
	}
}
