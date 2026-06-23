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
    
    init() {
       // loadWeather(for: "Dubai")
        loadWeather(for: "Mexico City")
    }

    func loadWeather(for city: String) {
        
        self.isLoading = true
        self.errorMessage = nil
        
        NetworkManager.shared.fetchWeatherData(for: city) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let data):
                self.weather = data
                self.isMorning = (data.current.isDay == 1)
                print("✅ Weather data loaded successfully for: \(data.location.name)  \( self.isMorning)")
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print("❌ Error fetching weather: \(error.localizedDescription)")
            }
        }
    }
}
