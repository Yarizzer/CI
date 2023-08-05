//
//  TableViewProviderType.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

import UIKit

protocol TableViewProviderType {
    var onConfigureCell: ((IndexPath) -> UITableViewCell)? { get set }
    var onSelectCell: ((IndexPath) -> ())? { get set }
    func registerCells(_ cells: [UITableViewCell.Type])
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell
    func reloadData()
}
