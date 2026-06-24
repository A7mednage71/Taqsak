//
//  HomeFailureState.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 24/06/2026.
//

import SwiftUI

struct HomeFailureState: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    let errorMessage: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text("❌ Connection Error")
                .font(AppFonts.font22regular)
            Text(errorMessage)
                .font(AppFonts.font14light)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .foregroundStyle(homeViewModel.isMorning ? .black : .white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
    }
}

#Preview {
    NavigationStack {
        HomeFailureState(errorMessage: "Failed to load weather data")
    }
    .environmentObject(HomeViewModel())
}
