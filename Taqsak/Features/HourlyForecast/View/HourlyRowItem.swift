//
//  HourlyRowItem.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct HourlyRowItem: View {
    let hour: HourDetail
    let isMorning: Bool
    
    var timeFormatted: String {
        // "2026-06-23 12:00" -> "12:00"
        let components = hour.time.split(separator: " ")
        if components.count > 1 {
            return String(components[1])
        }
        return hour.time
    }
    
    var body: some View {

        HStack(spacing: 16) {
            
            Text(timeFormatted)
                .font(AppFonts.font16regular)
                .frame(width: 60, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 2) {
                AsyncImage(url: URL(string: "https:\(hour.condition.icon)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: isMorning ? .black : .white))
                }
                .frame(width: 32, height: 32)
                
                if hour.chanceOfRain > 0 {
                    Text("\(hour.chanceOfRain)%")
                        .font(AppFonts.font14light)
                        .foregroundColor(isMorning ? .blue : .cyan)
                }
            }
            
            Spacer()
            
            Text("\(Int(hour.tempC))°")
                .font(AppFonts.font16regular)
                .frame(width: 50, alignment: .trailing)
            
        }
        .foregroundStyle(isMorning ? .black : .white)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(.ultraThinMaterial.opacity(0.75))
        .cornerRadius(14)
    }
}

#Preview {
    HourlyRowItem(hour: .placeholderMock, isMorning: true)
}
