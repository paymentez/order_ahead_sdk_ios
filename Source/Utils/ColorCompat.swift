//
//  ColorCompat.swift
//  Alamofire
//
//  Created by Fennoma on 28/12/2020.
//

import Foundation

class ColorCompat {
    
    static func getOrange() -> UIColor {
        return UIColor(red: 255 / 255, green: 119 / 255, blue: 0, alpha: 1)
    }
    
    static func getUnselectedGray() -> UIColor {
        return UIColor(red: 117 / 255, green: 117 / 255, blue: 117 / 255, alpha: 1)
    }
    
    static func getDisabledButtonColor() -> UIColor {
        return UIColor(red: 153 / 255, green: 153 / 255, blue: 153 / 255, alpha: 1)
    }
    
    static func getProductAmountGray() -> UIColor {
        return UIColor(red: 240 / 255, green: 243 / 255, blue: 245 / 255, alpha: 1)
    }
    
    static func getRemoveItemBackground() -> UIColor {
        return UIColor(red: 248 / 255, green: 107 / 255, blue: 107 / 255, alpha: 0.2)
    }
    
    static func getSeparator() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
}
