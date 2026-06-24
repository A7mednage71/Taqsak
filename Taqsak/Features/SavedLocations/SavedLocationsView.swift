//
//  SavedLocationsView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct SavedLocationsView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Image(homeViewModel.isMorning ? "morning_bg" : "evening_bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Saved Locations List Coming Soon...")
                    .font(AppFonts.font22regular)
                    .foregroundStyle(homeViewModel.isMorning ? .black : .white)
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
    }
}

#Preview {
    NavigationStack {
        SavedLocationsView()
    }
    .environmentObject(HomeViewModel())
}
