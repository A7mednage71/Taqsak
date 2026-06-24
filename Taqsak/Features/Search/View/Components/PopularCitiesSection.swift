//
//  PopularCitiesSection.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct PopularCitiesSection: View {
    
    let isMorning: Bool
    let onSelect: (String) -> Void
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Label("POPULAR CITIES", systemImage: "globe")
                    .font(AppFonts.font14semibold)
                    .foregroundStyle(isMorning ? Color.black.opacity(0.6) : Color.white.opacity(0.7))
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                    ForEach(PopularCity.allCases) { city in
                        Button(action: { onSelect(city.name) }) {
                            HStack(spacing: 6) {
                                Text(city.flag)
                                Text(city.name)
                                    .font(AppFonts.font14semibold)
                                    .lineLimit(1)
                                    .foregroundStyle(isMorning ? .black : .white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 8)
                            .background(.ultraThinMaterial.opacity(0.75))
                            .cornerRadius(20)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
