//
//  CartFooterView.swift
//  Alamofire
//
//  Created by Fennoma on 17/12/2020.
//

import Foundation

class CartFooterView: UITableViewCell, UITextViewDelegate {
    
    static var placeholder = ""
    
    @IBOutlet var container: UIView!
    @IBOutlet var totalPaymentTitle: UILabel!
    @IBOutlet var totalPayment: UILabel!
    @IBOutlet var comment: UITextView!
    
    func initialize() {
        if let textColor = PaymentezSDK.shared.style?.textColor {
            totalPaymentTitle.textColor = textColor
            totalPayment.textColor = textColor
        }
        CartFooterView.placeholder = PaymentezSDK.shared.getString("cart_add_instructions_placeholder")
        comment.text = CartFooterView.placeholder
        comment.delegate = self
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            container.backgroundColor = backgroundColor
            contentView.backgroundColor = backgroundColor
        }
    }
    
    func setPrice(price: Double?) {
        totalPayment.text = CurrencyUtils.getPrice(price)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if comment.text == CartFooterView.placeholder {
            comment.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if comment.text.isEmpty {
            comment.text = CartFooterView.placeholder
        }
    }

    func getComment() -> String {
        var result = ""
        if comment.text != CartFooterView.placeholder {
            result = comment.text
        }
        return result
    }
}
