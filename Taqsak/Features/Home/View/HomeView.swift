//
//  HomeView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 22/06/2026.
//


import SwiftUI
import Shimmer

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        
        ZStack {
            
            if homeViewModel.isMorning {
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
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HomeCustomTopNavigationBar()
                        .padding(.horizontal, 16)
                    
                    if homeViewModel.isLoading {
                        HomeLoadingState()
                    } else if let errorMessage = homeViewModel.errorMessage {
                        HomeFailureState(errorMessage: errorMessage)
                    } else if let weather = homeViewModel.weather {
                        HomeContentState(weather: weather)
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(HomeViewModel())
}


