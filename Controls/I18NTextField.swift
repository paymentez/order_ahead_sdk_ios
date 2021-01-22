//
//  I18NTextField.swift
//  ImageLoader
//
//  Created by Fennoma on 18/01/2021.
//

import Foundation
import UIKit

class I18NTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeText()
    }
    
    func changeText() {
        if let text = self.text, let bundle = PaymentezSDK.shared.getBundle() {
            self.text = NSLocalizedString(text, bundle: bundle, comment: "")
        }
        if let placeholder = self.placeholder, let bundle = PaymentezSDK.shared.getBundle() {
            self.placeholder = NSLocalizedString(placeholder, bundle: bundle, comment: "")
        }
    }
    
    func changePlaceholderColor(color: UIColor, _ placeholder: String? = "") {
        var text = placeholder
        if(text == "") {
            text = self.placeholder
        }
        if text == nil {
            text = ""
        }
        self.attributedPlaceholder = NSAttributedString(string: text!,
        attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}

