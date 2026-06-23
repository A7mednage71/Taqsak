//
//  WeatherResponse.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation

struct WeatherResponse: Codable {
    let location: LocationInfo
    let current: CurrentWeather
    let forecast: ForecastData
}

struct LocationInfo: Codable {
    let name: String
}

struct CurrentWeather: Codable {
    let tempC: Double
    let condition: WeatherCondition
    let windKph: Double
    let humidity: Int
    let feelslikeC: Double
    let visKm: Double
    let pressureMb: Double
    let isDay: Int

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKm = "vis_km"
        case pressureMb = "pressure_mb"
        case isDay = "is_day"
    }
}

struct WeatherCondition: Codable {
    let text: String
    let icon: String
}

struct ForecastData: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable, Identifiable {
    var id: String { date }
    let date: String
    let day: DayDetail
    let hour: [HourDetail]
}


struct DayDetail: Codable {
    let maxtempC: Double
    let mintempC: Double
    let condition: WeatherCondition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

struct HourDetail: Codable, Identifiable {
    let id = UUID()
    let time: String
    let tempC: Double
    let condition: WeatherCondition
    let chanceOfRain: Int

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        case chanceOfRain = "chance_of_rain"
    }
}
