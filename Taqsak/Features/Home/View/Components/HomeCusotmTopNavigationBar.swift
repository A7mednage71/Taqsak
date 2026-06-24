//
//  HomeCustomTopNavigationBar.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 24/06/2026.
//

import SwiftUI

struct HomeCustomTopNavigationBar: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HStack {
            NavigationLink(destination: WeatherSearchView()) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundStyle(homeViewModel.isMorning ? .black : .white)
                    .padding(12)
                    .background(.ultraThinMaterial.opacity(0.7))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            if !homeViewModel.isShowingDefaultCity {
                Button(action: {
                    withAnimation {
                        homeViewModel.resetToDefaultLocation()
                    }
                }) {
                    Image(systemName: "location.fill")
                        .font(.title2)
                        .foregroundStyle(homeViewModel.isMorning ? .black : .white)
                        .padding(12)
                        .background(.ultraThinMaterial.opacity(0.7))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .transition(.scale.combined(with: .opacity))
            }
            
            Spacer()
            
            NavigationLink(destination: SavedLocationsView()) {
                Image(systemName: "list.star")
                    .font(.title2)
                    .foregroundStyle(homeViewModel.isMorning ? .black : .white)
                    .padding(12)
                    .background(.ultraThinMaterial.opacity(0.7))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    HomeCustomTopNavigationBar()
        .environmentObject(HomeViewModel())
        .background(Color.blue)
}
