//
//  HomeViewHeader.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct HomeViewHeader: View {
    
    let weather: WeatherResponse
    let isMorning: Bool
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Text(weather.location.name)
                .font(AppFonts.font42bold)
                .foregroundStyle(isMorning ? .black : .white)
            
            Text("\(Int(weather.current.tempC))°")
                .font(AppFonts.font76thin)
                .foregroundStyle(isMorning ? .black : .white)
            
            Text(weather.current.condition.text)
                .font(AppFonts.font22regular)
                .foregroundStyle(isMorning ? .black.opacity(0.8) : .white.opacity(0.9))
            
            if let today = weather.forecast.forecastday.first {
                Text("H:\(Int(today.day.maxtempC))°  L:\(Int(today.day.mintempC))°")
                    .font(AppFonts.font18medium)
                    .foregroundStyle(isMorning ? .black : .white)
            }
            
            AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: isMorning ? .black : .white))
            }
            .frame(width: 80, height: 80)
            
        }
        .padding(.top, 8)
    }
}
