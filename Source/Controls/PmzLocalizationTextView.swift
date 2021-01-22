//
//  I18NTextView.swift
//  ImageLoader
//
//  Created by Fennoma on 18/01/2021.
//

import Foundation
import UIKit

class PmzLocalizationTextView: UITextView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeText()
    }
    
    func changeText() {
        if let text = self.text {
            self.text = NSLocalizedString(text, comment: "")
        }
    }
}

