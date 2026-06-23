//
//  HomeView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 22/06/2026.
//


import SwiftUI
import Shimmer

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            if viewModel.isMorning {
                Image("morning_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Image("evening_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            if viewModel.isLoading {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        HomeViewHeader(weather: .placeholderMock, isMorning: viewModel.isMorning)
                        Spacer().frame(height: 40)
                        HomeDaysForecastSection(forecast: .placeholderMock, isMorning: viewModel.isMorning)
                        Spacer().frame(height: 40)
                        WeatherHomeGrid(current: .placeholderMock, isMorning: viewModel.isMorning)
                    }
                }
                .padding(16)
                .redacted(reason: .placeholder)
                .shimmering()
                .disabled(true)
                
            } else if let errorMessage = viewModel.errorMessage {
                
                VStack(spacing: 12) {
                    Text("❌ Connection Error")
                        .font(AppFonts.font22regular)
                    Text(errorMessage)
                        .font(AppFonts.font14light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
                .foregroundStyle(viewModel.isMorning ? .black : .white)
                
            } else if let weather = viewModel.weather {
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        HomeViewHeader(weather: weather, isMorning: viewModel.isMorning)
                        
                        Spacer().frame(height: 40)
                        
                        HomeDaysForecastSection(forecast: weather.forecast, isMorning: viewModel.isMorning)
                        
                        Spacer().frame(height: 40)
                        
                        WeatherHomeGrid(current: weather.current, isMorning: viewModel.isMorning)
                        
                        Spacer()
                    }
                }.padding(.horizontal , 16)
            }
        }
    }
}

#Preview {
    HomeView()
}
