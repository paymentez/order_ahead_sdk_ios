//
//  StoreItemView.swift
//  PaymentezSDK
//
//  Created by Fennoma on 02/12/2020.
//

import Foundation

public class StoreCellView: UITableViewCell {
    
    @IBOutlet weak var container: CardView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var logoContainer: UIView!
    @IBOutlet weak var distance: UILabel!
    
    weak var store: PmzStore?
    
    func configure(store: PmzStore) {
        self.store = store
        setImageCorners()
        PmzImageUtils.loadImage(store.imageUrl, imageView: headerImage)
        PmzImageUtils.loadImage(store.commerceImage, imageView: logo)
        
        logoContainer.clipsToBounds = true
        logoContainer.layer.masksToBounds = true
        logoContainer.layer.cornerRadius = 26
        
        logo.layer.borderWidth = 0
        logo.layer.borderColor = UIColor.white.cgColor
        
        title.text = store.name
        subtitle.text = store.commerceName
        
        if let style = PaymentezSDK.shared.style, let textColor = style.textColor {
            title.textColor = textColor
            subtitle.textColor = textColor
            distance.textColor = textColor
        }
        
        container.setCornerRadius(cornerRadius: 10)
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            container.backgroundColor = backgroundColor
            contentView.backgroundColor = backgroundColor
        }
        
        if let location = store.location,
            let lastKnownLocation = LocationManager.sharedInstance.lastKnownLocation {
            let distanceString = DistanceHelper.stringForMeters(meters: (lastKnownLocation.distance(from: location)))
            distance!.text = distanceString
        } else {
            distance!.text = "-"
        }
    }
    
    func setImageCorners() {
        headerImage.roundCorners(corners: [.topLeft, .topRight], radius: 10)
    }
}
