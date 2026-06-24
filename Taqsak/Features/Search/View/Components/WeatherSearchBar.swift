//
//  WeatherSearchBar.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import SwiftUI

struct WeatherSearchBar: View {
    
    @Binding var searchQuery: String
    let isMorning: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColors.getContentColor(isMorning: isMorning))
            
            TextField("Search city...", text: $searchQuery)
                .textFieldStyle(.plain)
                .foregroundColor(isMorning ? .black : .white)
                .autocorrectionDisabled()
            
            if !searchQuery.isEmpty {
                Button(action: { searchQuery = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(isMorning ? .black.opacity(0.5) : .white.opacity(0.5))
                }
            }
        }
        .padding()
        .frame(height: 50)
        .background(.ultraThinMaterial.opacity(0.6))
        .cornerRadius(14)
        .padding(.horizontal)
    }
}
