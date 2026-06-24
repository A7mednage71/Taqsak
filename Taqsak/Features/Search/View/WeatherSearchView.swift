//
//  WeatherSearchView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct WeatherSearchView: View {
    
    @StateObject private var viewModel = WeatherSearchViewModel()
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
            ZStack {
                Image(homeViewModel.isMorning ? "morning_bg" : "evening_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    WeatherSearchBar(
                        searchQuery: $viewModel.searchQuery,
                        isMorning: homeViewModel.isMorning
                    )
                    contentSection
                }
                .padding(.top, 10)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Search")
                        .font(AppFonts.font24bold)
                        .foregroundStyle(homeViewModel.isMorning ? Color.black : Color.white)
                }
            }
    }
    
    @ViewBuilder
    private var contentSection: some View {
        
        if viewModel.isLoading {
            
            WeatherSearchLoadingView(isMorning: homeViewModel.isMorning)
            
        } else if !viewModel.searchResults.isEmpty {
            
            WeatherSearchResultsSection(
                results: viewModel.searchResults
            )
            
        } else {
            
            PopularCitiesSection(
                isMorning: homeViewModel.isMorning
            ) { city in
                viewModel.searchQuery = city
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        WeatherSearchView()
    }
    .environmentObject(HomeViewModel())
}
