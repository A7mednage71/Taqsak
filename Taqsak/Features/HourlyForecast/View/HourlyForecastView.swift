//
//  HourlyForecastView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct HourlyForecastView: View {
    let dayName : String
    let hours: [HourDetail]
    let isMorning: Bool
    
    var body: some View {
        
        ZStack {

            if isMorning {
                Image("morning_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Image("evening_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
                
            VStack(alignment: .leading, spacing: 16) {
                
                Text("HOURLY FORECAST")
                    .font(AppFonts.font14semibold)
                    .foregroundStyle(isMorning ? Color.black.opacity(0.6) : Color.white.opacity(0.7))
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 12) {
                        ForEach(hours, id: \.id) { hour in
                            HourlyRowItem(hour: hour, isMorning: isMorning)
                        }
                    }
                }
            }
            .padding(.horizontal)

        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(isMorning ? .light : .dark, for: .navigationBar)
        .tint(isMorning ? .black : .white)
        
        .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(dayName)
                            .font(AppFonts.font18medium)
                            .foregroundStyle(isMorning ? Color.black : Color.white)
                    }
                }
    }
      
}

#Preview {
    HourlyForecastView(dayName: "Today", hours: [.placeholderMock, .placeholderMock, .placeholderMock], isMorning: true)
}
