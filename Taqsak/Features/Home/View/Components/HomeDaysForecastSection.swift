//
//  HomeDaysForecastSection.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct HomeDaysForecastSection: View {
    let forecast: ForecastData
    let isMorning: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("3-DAY FORECAST")
                .font(AppFonts.font14semibold)
                .foregroundStyle(isMorning ? .black.opacity(0.6) : .white.opacity(0.7))
                .padding(.bottom, 4)
            
            ForEach(Array(forecast.forecastday.enumerated()), id: \.element.id) { index, day in
                let dayLabel = index == 0 ? "Today" : (index == 1 ? "Tomorrow" : "After tomorrow")
                
                DayForecastItem(
                    dayName: dayLabel,
                    iconUrl: "https:\(day.day.condition.icon)",
                    tempRange: "\(Int(day.day.mintempC))° - \(Int(day.day.maxtempC))°",
                    isLast: index == forecast.forecastday.count - 1,
                    isMorning: isMorning
                )
            }
        }
        .padding()
        .background(.ultraThinMaterial.opacity(0.75))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct DayForecastItem: View {
    
    var dayName: String
    var iconUrl: String
    var tempRange: String
    var isLast: Bool
    var isMorning: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                Text(dayName)
                    .frame(width: 110, alignment: .leading)
                
                Spacer()
                
                AsyncImage(url: URL(string: iconUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 32, height: 32)
                
                Spacer()
                
                Text(tempRange)
                    .frame(width: 100, alignment: .trailing)
                
            }
            .font(AppFonts.font16regular)
            .padding(.vertical, 10)
            .foregroundStyle(isMorning ? .black : .white)
            
            if !isLast {
                Divider()
                    .overlay(isMorning ? Color.black.opacity(0.4) : Color.white.opacity(0.5))
            }
        }
    }
}
