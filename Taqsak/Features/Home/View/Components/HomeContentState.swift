//
//  HomeContentState.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 24/06/2026.
//

import SwiftUI

struct HomeContentState: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    let weather: WeatherResponse
    
    var body: some View {
        VStack(spacing: 0) {
            HomeViewHeader(weather: weather, isMorning: homeViewModel.isMorning)
            
            Spacer().frame(height: 40)
            
            HomeDaysForecastSection(forecast: weather.forecast, isMorning: homeViewModel.isMorning)
            
            Spacer().frame(height: 40)
            
            WeatherHomeGrid(current: weather.current, isMorning: homeViewModel.isMorning)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    NavigationStack {
        HomeContentState(weather: .placeholderMock)
    }
    .environmentObject(HomeViewModel())
}
