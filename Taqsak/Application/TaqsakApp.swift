//
//  TaqsakApp.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 21/06/2026.
//

import SwiftUI

@main
struct TaqsakApp: App {
    
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            
            if showSplash {
                SplashView {showSplash = false}
            }
            else{
                HomeView()
            }
            
        }
    }
}
