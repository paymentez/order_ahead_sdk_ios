//
//  LocationManager.swift
//  PaymentezSDK
//
//  Created by Fennoma on 21/04/2021.
//

import Foundation
//import PromiseKit

protocol CLLocationListener {
    func locationGranted()
}

class LocationManager{
//class LocationManager: CLLocationManager, CLLocationManagerDelegate {
    /*static let sharedInstance = LocationManager()
    var lastKnownLocation: CLLocation?
    var defaultLocation: CLLocation = CLLocation(latitude: -34.6037, longitude: -58.3816)
    var started: Bool = false
    var locationListener: CLLocationListener?

    override init() {
        super.init()
        delegate = self
        desiredAccuracy = kCLLocationAccuracyBest
        requestLocation()
    }
    
    func startIfNotStarted() {
        if !started {
            started = true
            startUpdatingLocation()
        }
    }
    
    func stopIfStarted() {
        if started {
            started = true
            stopUpdatingLocation()
        }
    }
    
    func removeListener() {
        locationListener = nil
    }
    
    func isLocationEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            }
        } else {
            return false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations[0]
        locationListener?.locationGranted()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error)
    }*/
    
}

