//
//  SplashScreenView.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.primary500
            HStack(spacing: 13) {
                Image(.splash)
                    .resizable()
                    .frame(width: 38, height: 38)
                    .foregroundStyle(.white)
                
                Text("Bazar.")
                    .font(.robotoBold(32))
                    .foregroundStyle(.white)
                    
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreenView()
}
