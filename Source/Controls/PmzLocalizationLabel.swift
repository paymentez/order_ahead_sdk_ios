//
//  I18NLabel.swift
//  ImageLoader
//
//  Created by Fennoma on 18/01/2021.
//

import Foundation
import UIKit

class PmzLocalizationLabel: UILabel {
    
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
    }
    
    func setLocalizedText(key: String?) {
        if let key = key, let bundle = PaymentezSDK.shared.getBundle() {
            self.text = NSLocalizedString(key, bundle: bundle, comment: "")
        }
    }
}

