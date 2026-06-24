//
//  WeatherHomeGrid.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct WeatherHomeGrid: View {
    
    let current: CurrentWeather
    let isMorning: Bool
        
    private let coulmns = [GridItem(.flexible()), GridItem(.flexible())]
        
    var body: some View {
        LazyVGrid(columns: coulmns, spacing: 12) {
            
            WeatherGridItem(
                title: "VISIBILITY",
                subTitle: "Perfect clear view",
                iconName: "eye.fill",
                value: "\(Int(current.visKm)) km",
                isMorning: isMorning
            )
            
            WeatherGridItem(
                title: "HUMIDITY",
                subTitle: "The dew point is right now",
                iconName: "humidity.fill",
                value: "\(current.humidity)%",
                isMorning: isMorning
            )
            
            WeatherGridItem(
                title: "FEELS LIKE",
                subTitle: "Wind behavior temperature",
                iconName: "thermometer.medium",
                value: "\(Int(current.feelslikeC))°",
                isMorning: isMorning
            )
            
            WeatherGridItem(
                title: "PRESSURE",
                subTitle: "Atmospheric pressure",
                iconName: "gauge.with.needle.fill",
                value: String(format: "%.0f mb", current.pressureMb),
                isMorning: isMorning
            )
            
        }
        .padding(.horizontal)
    }
}

struct WeatherGridItem: View {
    
    var title: String
    var subTitle: String
    var iconName: String
    var value: String
    var isMorning: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(AppFonts.font14semibold)
                    .foregroundStyle(isMorning ? .black.opacity(0.7) : .white.opacity(0.7))
                Spacer()
                Image(systemName: iconName)
                    .foregroundStyle(isMorning ? .black.opacity(0.6) : .white.opacity(0.6))
            }
            
            Text(value)
                .font(AppFonts.font42bold)
                .foregroundStyle(isMorning ? .black : .white)
            
            Text(subTitle)
                .font(AppFonts.font14light)
                .foregroundStyle(isMorning ? .black.opacity(0.6) : .white.opacity(0.6))
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 140)
        .padding()
        .background(.ultraThinMaterial.opacity(0.75))
        .cornerRadius(12)
        .foregroundStyle(isMorning ? .black : .white)
    }
}
