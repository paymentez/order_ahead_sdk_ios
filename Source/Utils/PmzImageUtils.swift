//
//  ImageUtils.swift
//  Alamofire
//
//  Created by Fennoma on 02/12/2020.
//

import Foundation
import SDWebImage

class PmzImageUtils {
    
    static func loadImage(_ imageUrl: String?, imageView: UIImageView) {
        if let imageUrl = imageUrl {
            imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
