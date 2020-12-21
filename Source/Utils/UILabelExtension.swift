//
//  UILabelExtension.swift
//  Alamofire
//
//  Created by Fennoma on 21/12/2020.
//

import Foundation

extension UILabel {

    func calculateMaxLines() -> Int {
        if self.text != "" {
            let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
            let charSize = font.lineHeight
            let text = (self.text ?? "") as NSString
            let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
            let linesRoundedUp = Int(ceil(textSize.height/charSize))
            return linesRoundedUp
        }
        return 0
    }
}
