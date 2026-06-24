//
//  SavedLocationsView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI
import SwiftData

struct SavedLocationsView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: [SortDescriptor(\SavedCity.savedAt, order: .reverse)])
    private var savedCities: [SavedCity]
    
    @State private var showDeleteConfirmation = false
    @State private var cityToDelete: SavedCity?
    
    var body: some View {
        
        ZStack {
            Image(homeViewModel.isMorning ? "morning_bg" : "evening_bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if savedCities.isEmpty {
                emptyState
            } else {
                citiesList
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Saved Locations")
                    .font(AppFonts.font24bold)
                    .foregroundStyle(homeViewModel.isMorning ? Color.black : Color.white)
            }
        }
        .confirmationDialog(
                    "Are you sure you want to delete \(cityToDelete?.name ?? "")?",
                    isPresented: $showDeleteConfirmation,
                    titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    if let city = cityToDelete {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            modelContext.delete(city)
                            try? modelContext.save()
                        }
                    }
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This action cannot be undone.")
        }
    }
    
    @ViewBuilder
    private var emptyState: some View {
        
        VStack(spacing: 16) {
            Image(systemName: "mappin.slash")
                .font(.system(size: 60))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(homeViewModel.isMorning ? .black : .white)
            
            Text("No saved locations yet")
                .font(AppFonts.font18medium)
                .foregroundStyle(homeViewModel.isMorning ? .black : .white)
            
            Text("Search and save your favorite cities")
                .font(AppFonts.font14light)
                .foregroundStyle(homeViewModel.isMorning ? .black.opacity(0.6) : .white.opacity(0.6))
        }
        .padding()
    }
    
    @ViewBuilder
    private var citiesList: some View {
        List {
            
            ForEach(savedCities) { city in
                
                CityRow(
                    city: city,
                    isMorning: homeViewModel.isMorning,
                    onTap: {
                        homeViewModel.fetchWeatherForCity(city.name)
                        dismiss()
                    }
                )

                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        
                    Button(role: .destructive) {
                        cityToDelete = city
                        showDeleteConfirmation = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.top, 20)
    }
}

struct CityRow: View {
    
    let city: SavedCity
    let isMorning: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            
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
                
                Image(systemName: isMorning ? "sun.max.fill" : "moon.stars.fill")
                    .font(.system(size: 20))
                    .symbolRenderingMode(.multicolor)
            }.padding()
            .background(.ultraThinMaterial.opacity(isMorning ? 0.5 : 0.2))
            .cornerRadius(12)
            .contentShape(Rectangle())
        }
    }
}
