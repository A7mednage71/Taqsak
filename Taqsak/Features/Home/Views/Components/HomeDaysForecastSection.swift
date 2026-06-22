//
//  HomeDaysForecastSection.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation
import SwiftUICore
import SwiftUI



struct HomeDaysForecastSection : View {
   
    var body: some View {
        
        VStack(alignment: .leading , spacing: 8) {
            
            Text("3-DAY FORECAST")
                .font(AppFonts.font14semibold)
                .foregroundStyle(.white.opacity(0.7))
            
            DayForecastItem(dayName: "Today", isLast: false)
            DayForecastItem(dayName: "Wed", isLast: false)
            DayForecastItem(dayName: "Thu", isLast: true)
                          
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
        .padding(.horizontal)
        
    }
    
}

struct DayForecastItem : View {
    
    var dayName :String
    var isLast : Bool
   
    var body: some View {
        
        VStack {
            
            HStack{
                
                Text(dayName)
                    .foregroundStyle(.white)
                    .frame(width: 100 , alignment: .leading)
                
                Spacer()
                
                Image(systemName: "cloud.sun.bolt.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                Spacer()
                
                Text("20° - 8°")
                    .foregroundStyle(.white)
                    .frame(width: 100, alignment: .trailing)
                
            }.font(AppFonts.font16regular)
                .padding(.vertical,10)
            
            if !isLast{
                Divider().background(Color.white.opacity(0.2))
            }
            
        }
        
    }
    
}
