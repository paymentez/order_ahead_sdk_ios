//
//  CartItemCellView.swift
//  Alamofire
//
//  Created by Fennoma on 16/12/2020.
//

import Foundation

class CartItemCellView: UITableViewCell {
    
    @IBOutlet var container: UIView!
    @IBOutlet var innerContainer: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var content: UILabel!
    @IBOutlet var price: UILabel!
    
    func configure(item: PmzItem) {
        PmzImageUtils.loadImage(item.imageUrl, imageView: img)
        name.text = item.productName
        content.text = generateContent(configs: item.configurations)
        var priceToDisplay: Double = 0
        if let totalPrice = item.totalAmount {
            priceToDisplay = totalPrice
        }
        price.text = CurrencyUtils.getPrice(priceToDisplay)
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            container.backgroundColor = backgroundColor
            innerContainer.backgroundColor = backgroundColor
            contentView.backgroundColor = backgroundColor
        }
        if let textColor = PaymentezSDK.shared.style?.textColor {
            name.textColor = textColor
            price.textColor = textColor
        }
    }
    
    func generateContent(configs: [PmzConfiguration]?) -> String {
        var result = ""
        if let configs = configs {
            for config in configs {
                if let desc = config.description {
                    if result != "" {
                        result = result + "\n"
                    }
                    result = result + "+ " + desc
                }
            }
        }
        return result
    }
}
