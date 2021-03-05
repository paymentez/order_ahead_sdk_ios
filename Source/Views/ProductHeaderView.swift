//
//  ProductHeaderView.swift
//  Alamofire
//
//  Created by Fennoma on 15/12/2020.
//

import Foundation

class ProductHeaderView: UITableViewCell {
    
    @IBOutlet var container: UIView!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var price: UILabel!
    
    func configure(product: PmzProduct?) {
        if let product = product {
            name.text = product.name
            if product.description != "" {
                desc.text = product.description
            } else {
                desc.text = " "
            }
            price.text = CurrencyUtils.getPrice(product.currentPrice)
            PmzImageUtils.loadImage(product.imageUrl, imageView: productImage)
        }
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            container.backgroundColor = backgroundColor
            contentView.backgroundColor = backgroundColor
        }
        if let textColor = PaymentezSDK.shared.style?.textColor {
            name.textColor = textColor
            desc.textColor = textColor
        }
    }
    
    func getAmountOfLines() -> Int {
        return desc.calculateMaxLines()
    }
}
