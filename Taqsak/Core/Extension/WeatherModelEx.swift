//
//  WeatherModelEx.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation

extension WeatherResponse {
    static let placeholderMock = WeatherResponse(
        location: LocationInfo(name: "Cairo City"),
        current: .placeholderMock,
        forecast: ForecastData(forecastday: [
            .placeholderMock, .placeholderMock, .placeholderMock
        ])
    )
}

extension CurrentWeather {
    static let placeholderMock = CurrentWeather(tempC: 20.0, condition: WeatherCondition(text: "Loading Weather", icon: ""), windKph: 0, humidity: 0, feelslikeC: 20.0, visKm: 10.0, pressureMb: 1000.0, isDay: 1)
}

extension ForecastDay {
    static let placeholderMock = ForecastDay(date: "2026-06-23", day: DayDetail(maxtempC: 25.0, mintempC: 15.0, condition: WeatherCondition(text: "Loading", icon: "")), hour: [
        .placeholderMock, .placeholderMock, .placeholderMock
    ])
}

extension ForecastData {
    static let placeholderMock = ForecastData(
        forecastday: [.placeholderMock, .placeholderMock, .placeholderMock]
    )
}

extension HourDetail {
    static let placeholderMock = HourDetail(time: "2026-06-23 12:00", tempC: 22.0, condition: WeatherCondition(text: "Loading", icon: ""), chanceOfRain: 0)
}
