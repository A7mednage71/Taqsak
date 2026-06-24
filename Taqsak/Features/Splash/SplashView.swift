//
//  SplashView.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 22/06/2026.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    var onFinish : (() -> Void)?
    
    var body: some View {
        
        ZStack {
            
            AppColors.eveningGradient.ignoresSafeArea()
            
            VStack(spacing: 16){
                
                Image(systemName: "cloud.sun.bolt.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                    .opacity(isAnimating ? 1.0 : 0.0)
                
                Text("Taqsak")
                    .font(AppFonts.font42bold)
                    .foregroundColor(.white)
                    .tracking(3)
                    .offset(y: isAnimating ? 0 : 20)
                    .opacity(isAnimating ? 1.0 : 0.0)
                
                Text("Your Weather Companion")
                    .font(AppFonts.font14light)
                    .foregroundColor(.white.opacity(0.7))
                    .offset(y: isAnimating ? 0 : 20)
                    .opacity(isAnimating ? 1.0 : 0.0)
                
            }
        }
        .onAppear {
            
            withAnimation(.easeOut(duration: 1.5)) {
                isAnimating = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                onFinish?()
            }
            
        }
    }
}

#Preview {
    SplashView()
}
