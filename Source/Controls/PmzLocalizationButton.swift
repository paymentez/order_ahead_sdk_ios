//
//  I18NButton.swift
//  ImageLoader
//
//  Created by Fennoma on 18/01/2021.
//

import Foundation
import UIKit

class PmzLocalizationButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeText()
    }
    
    func changeText() {
        if let text = self.titleLabel?.text, let bundle = PaymentezSDK.shared.getBundle() {
            self.setTitle(NSLocalizedString(text, bundle: bundle, comment: ""), for: .normal)
        }
        if let text = self.title(for: .normal), let bundle = PaymentezSDK.shared.getBundle() {
            self.setTitle(NSLocalizedString(text, bundle: bundle, comment: ""), for: .normal)
        }
        if let text = self.title(for: .highlighted), let bundle = PaymentezSDK.shared.getBundle() {
            self.setTitle(NSLocalizedString(text, bundle: bundle, comment: ""), for: .normal)
        }
    }
    
}
