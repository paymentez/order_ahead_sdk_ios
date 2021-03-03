//
//  TableViewExtension.swift
//  PaymentezSDK
//
//  Created by Fennoma on 03/03/2021.
//

import Foundation
open class TableView: UITableView {
    
    deinit {
        dataSource = nil
        delegate = nil
    }
}
