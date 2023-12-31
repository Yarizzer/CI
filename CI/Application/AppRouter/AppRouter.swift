//
//  AppRouter.swift
//  CI
//
//  Created by Yaroslav Abaturov on 25.07.2023.
//

import UIKit

protocol AppRoutable: AnyObject {
    func routeToInitialScene()
}

class AppRouter {
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.backgroundColor = .systemBackground
    }
    
    private let window: UIWindow
}

extension AppRouter: AppRoutable {
    func routeToInitialScene() {
        window.rootViewController = InitialSceneRouter.assembly()
        window.makeKeyAndVisible()
    }
}
