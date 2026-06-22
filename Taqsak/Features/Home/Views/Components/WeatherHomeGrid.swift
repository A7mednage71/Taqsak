//
//  WeatherHomeGrid.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation
import SwiftUICore
import SwiftUI

struct WeatherHomeGrid : View {
        
    private let coulmns = [ GridItem(.flexible()) , GridItem(.flexible()) ]
        
    var body : some View {
     
        LazyVGrid(columns: coulmns , spacing: 16) {
                WeatherGridItem(
                        title: "VISIBILITY",
                        subTitle: "Perfect clear view",
                        iconName: "eye.fill",
                        value: "10 km",
                )
                        
                WeatherGridItem(
                        title: "HUMIDITY",
                        subTitle: "The dew point is 11° right now",
                        iconName: "humidity.fill",
                        value: "36%"
                )
                        
                WeatherGridItem(
                        title: "FEELS LIKE",
                        subTitle: "Wind is making it feel colder",
                        iconName: "thermometer.medium",
                        value: "16°"
                )
                        
                WeatherGridItem(
                        title: "PRESSURE",
                        subTitle: "Standard atmospheric pressure",
                        iconName: "gauge.with.needle.fill",
                        value: "1,021"
                )
            
        }.padding(.horizontal)
        
    }
    
}


struct WeatherGridItem : View {
    
    var title : String
    var subTitle : String
    var iconName : String
    var value : String
    
    var body : some View {
        
        VStack(alignment: .leading , spacing: 8) {
            
            HStack {
                Text(title)
                    .font(AppFonts.font14semibold)
                    .opacity(0.7)
                    .foregroundStyle(.white)
                Spacer()
                
                Image(systemName: iconName).foregroundStyle(.white)
            }
            
            Text(value)
                .font(AppFonts.font42bold)
                .foregroundStyle(.white)
            
            Text(subTitle)
                .font(AppFonts.font14light)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 130)
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
        
    }
    
}
