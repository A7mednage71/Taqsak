//
//  WeatherSearchResultsSection.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct WeatherSearchResultsSection: View {
    
    let results: [SearchCityResult]
    let isMorning: Bool
    let onSelect: (SearchCityResult) -> Void
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack(spacing: 12) {
                
                ForEach(results) { city in
                    
                    HStack {
                        
                        Button(action: { onSelect(city) }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(city.name)
                                        .font(AppFonts.font16semibold)
                                    Text("\(city.region), \(city.country)")
                                        .font(AppFonts.font13semibold)
                                        .opacity(0.7)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .bold))
                                    .opacity(0.5)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Spacer().frame(width: 8)
                        
                        Button(action: {
                            print("Saved/Unsaved city: \(city.name)")
                        }) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(10)
                                .background(.ultraThinMaterial.opacity(isMorning ? 0.6 : 0.3))
                                .clipShape(Circle())
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    .background(.ultraThinMaterial.opacity(isMorning ? 0.5 : 0.2))
                    .cornerRadius(12)
                    
                }
            }
            .padding(.horizontal)
        }
    }
}
