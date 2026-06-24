//
//  WeatherSearchResultsSection.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI
import SwiftData

struct WeatherSearchResultsSection: View {
    
    let results: [SearchCityResult]
    let onTap: (SearchCityResult) -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(results) { city in
                    WeatherSearchResultRow(city: city, onTap: onTap)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct WeatherSearchResultRow: View {
    
    let city: SearchCityResult
    let onTap: (SearchCityResult) -> Void
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @Environment(\.modelContext) private var modelContext
    
    @Query private var savedCities: [SavedCity]
    
    var body: some View {
        
        let isCitySaved = savedCities.contains(where: { $0.id == city.id })
        let isMorning = homeViewModel.isMorning
        
        HStack {
        
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    toggleSave(isSaved: isCitySaved)
                }
            }) {
                Image(systemName: isCitySaved ? "bookmark.fill" : "bookmark")
                    .font(AppFonts.font16semibold)
                    .foregroundStyle(isCitySaved ? .yellow : (isMorning ? .gray : .white))
                    .padding(10)
                    .background(.ultraThinMaterial.opacity(0.7))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            
            Spacer().frame(width: 8)

            Button(action: { onTap(city) }) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(city.name)
                            .font(AppFonts.font16semibold)
                            .foregroundStyle(isMorning ? .black : .white)
                        
                        Text("\(city.region), \(city.country)")
                            .font(AppFonts.font13semibold)
                            .foregroundStyle(isMorning ? .black.opacity(0.7) : .white.opacity(0.7))
                    }
                    
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.75))
                .cornerRadius(12)
            }
            .buttonStyle(.plain)
                    
    }
      
    }
    
    private func toggleSave(isSaved: Bool) {
        if isSaved {
            if let cityToDelete = savedCities.first(where: { $0.id == city.id}) {
                modelContext.delete(cityToDelete)
            }
        } else {
            let newCity = SavedCity(from: city)
            modelContext.insert(newCity)
        }
        try? modelContext.save()
    }
}
