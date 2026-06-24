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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(results) { city in
                    WeatherSearchResultRow(city: city)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct WeatherSearchResultRow: View {
    
    let city: SearchCityResult
    
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
                    .background(.ultraThinMaterial.opacity(isMorning ? 0.6 : 0.3))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            
            Spacer().frame(width: 8)

            NavigationLink(destination: Text("Weather Details for \(city.name)")) {
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
                        .font(AppFonts.font14bold)
                        .opacity(0.5)
                }
            }
            .buttonStyle(.plain)
                    
    }
        .padding()
        .background(.ultraThinMaterial.opacity(isMorning ? 0.5 : 0.2))
        .cornerRadius(12)
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
