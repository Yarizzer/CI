//
//  TableViewProviderViewModel.swift
//  CI
//
//  Created by Yaroslav Abaturov on 26.07.2023.
//

protocol TableViewProviderViewModel: AnyObject {
    var numberOfTableSections: Int { get }
    func numberOfTableRowsInSection(_ section: Int) -> Int
    func heightForRow(atIndex index: Int) -> Float
}
