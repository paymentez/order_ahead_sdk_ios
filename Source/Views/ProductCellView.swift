//
//  ProductCellView.swift
//  Alamofire
//
//  Created by Fennoma on 09/12/2020.
//

import Foundation

public class ProductCellView: UITableViewCell {
    
    @IBOutlet var container: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subtitleLbl: UILabel!
    @IBOutlet var addButton: UIView!
    @IBOutlet var addButtonText: UILabel!
    
    var store: PmzProduct?
    
    func configure(product: PmzProduct) {
        self.store = product
        PmzImageUtils.loadImage(product.imageUrl, imageView: img)
        
        titleLbl.text = product.name
        if let price = product.listPrice {
            subtitleLbl.text = CurrencyUtils.getPrice(price)
        } else {
            subtitleLbl.text = CurrencyUtils.getPrice(0)
        }
        
        if let style = PaymentezSDK.shared.style, let textColor = style.textColor {
            titleLbl.textColor = textColor
            subtitleLbl.textColor = textColor
        }
        if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            addButton?.backgroundColor = buttonColor
        }
        if let buttonTextColor = PaymentezSDK.shared.style?.buttonTextColor {
            addButtonText?.textColor = buttonTextColor
        }
    }
}
