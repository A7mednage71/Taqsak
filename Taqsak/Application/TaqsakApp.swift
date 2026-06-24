//
//  TaqsakApp.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 21/06/2026.
//

import SwiftUI
import SwiftData

@main
struct TaqsakApp: App {
    
    @State private var showSplash = true
    @StateObject private var homeViewModel = HomeViewModel()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([SavedCity.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            
            if showSplash {
                SplashView {showSplash = false}
            }
            else{
                NavigationStack {
                    HomeView()
                }
                .environmentObject(homeViewModel)
            }
            
        }
        .modelContainer(sharedModelContainer)
    }
}
