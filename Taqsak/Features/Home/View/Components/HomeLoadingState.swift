//
//  HomeLoadingState.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 24/06/2026.
//

import SwiftUI
import Shimmer

struct HomeLoadingState: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HomeViewHeader(weather: .placeholderMock, isMorning: homeViewModel.isMorning)
            Spacer().frame(height: 40)
            HomeDaysForecastSection(forecast: .placeholderMock, isMorning: homeViewModel.isMorning)
            Spacer().frame(height: 40)
            WeatherHomeGrid(current: .placeholderMock, isMorning: homeViewModel.isMorning)
        }
        .padding(16)
        .redacted(reason: .placeholder)
        .shimmering()
        .disabled(true)
    }
}

#Preview {
    NavigationStack {
        HomeLoadingState()
    }
    .environmentObject(HomeViewModel())
}
