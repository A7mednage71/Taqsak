//
//  HomeView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 22/06/2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
                
        ZStack {
            AppColors.eveningGradient.ignoresSafeArea()
            ScrollView {
                HomeViewHeader()
                Spacer().frame(height: 40)
                HomeDaysForecastSection()
                Spacer().frame(height: 40)
                WeatherHomeGrid()
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}


