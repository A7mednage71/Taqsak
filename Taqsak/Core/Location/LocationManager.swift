//
//  LocationManager.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 25/06/2026.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    var onCityFound: ((String) -> Void)?
    var onLocationFailed: (() -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            onLocationFailed?()
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let cityName = placemarks?.first?.locality {
                print("📍 GPS located user in: \(cityName)")
                self?.onCityFound?(cityName)
            } else {
                print("⚠️ Geocoding failed, calling backup.")
                self?.onLocationFailed?()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("⚠️ GPS Error or Denied: \(error.localizedDescription)")
        onLocationFailed?()
    }
}
