//
//  File.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//



import SwiftUI
import SwiftData

struct HomeViewHeader: View {
    var body: some View {
        
        VStack(spacing: 8) {
            
            Text("Cairo").font(AppFonts.font42bold)
                .foregroundStyle(.white)
            
            Text("15°").font(AppFonts.font76thin)
                .foregroundStyle(.white)
            
            Text("Clear Night").font(AppFonts.font22regular)
                .foregroundStyle(.white)
            
            Text("H:16° L:6°").font(AppFonts.font18medium)
                .foregroundStyle(.white)
            
            Image(systemName: "moon.stars.fill")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 80, height: 80)
            
        }.padding(.top,30)
    }
}
