//
//  TitleCellView.swift
//  Alamofire
//
//  Created by Fennoma on 11/12/2020.
//

import Foundation

class TitleCellView: UITableViewCell {
    
    @IBOutlet var container: UIView!
    @IBOutlet var titleView: UILabel!
    
    func configure(title: PmzTitleItem) {
        titleView.text = title.title
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            container.backgroundColor = backgroundColor
            contentView.backgroundColor = backgroundColor
        }
    }
}
