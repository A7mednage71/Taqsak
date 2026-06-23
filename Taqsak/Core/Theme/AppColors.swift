//
//  AppColors.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 22/06/2026.
//

import Foundation
import SwiftUI

struct AppColors {

    static let morningGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.cyan.opacity(0.5)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let eveningGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 0.08, green: 0.11, blue: 0.19), Color(red: 0.17, green: 0.24, blue: 0.37)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let cardBackground = Color.white.opacity(0.32)
    
    static func getFontColor(isMorning: Bool) -> Color {
        return isMorning ? .black : .white
    }
}
