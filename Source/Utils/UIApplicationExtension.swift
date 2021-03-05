//
//  UIApplicationExtension.swift
//  PaymentezSDK
//
//  Created by Fennoma on 05/03/2021.
//

import Foundation
extension UIApplication {

    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
