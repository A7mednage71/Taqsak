//
//  HomeViewModel.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var weather: WeatherResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isMorning: Bool = true
    
    private let locationManager = LocationManager()
    
    var defaultCity: String = "Alexandria"
    
    var isShowingDefaultCity: Bool {
        guard let currentCity = weather?.location.name else { return true }
        return currentCity.lowercased() == defaultCity.lowercased()
    }
    
    init() {
        setupLocationManager()
        fetchLocationAndWeather()
    }
    
    // MARK: - Setup Location Manager Callbacks
    private func setupLocationManager() {

        locationManager.onCityFound = { [weak self] cityName in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.defaultCity = cityName
                self.loadWeather(for: cityName)
            }
        }
        
        locationManager.onLocationFailed = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.loadWeather(for: self.defaultCity)
            }
        }
    }

    func fetchLocationAndWeather() {
        locationManager.requestLocation()
    }
    
    // MARK: - Weather API Fetching
    func loadWeather(for city: String) {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        NetworkManager.shared.fetchWeatherData(for: city) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let data):
                    self.weather = data
                    self.isMorning = (data.current.isDay == 1)
                    print("✅ Weather data loaded successfully for: \(data.location.name) (Morning: \(self.isMorning))")
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("❌ Error fetching weather: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func fetchWeatherForCity(_ cityName: String) {
        loadWeather(for: cityName)
    }
    
    func resetToDefaultLocation() {
        fetchLocationAndWeather()
    }
}
