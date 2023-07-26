//
//  BaseViewController.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

class BaseViewController<InteractorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: InteractorT?
}
