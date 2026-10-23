//
//  RootView.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

struct RootView: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        Group {
            switch router.flow {
            case .splash:
                SplashScreenView()
            case .onboarding:
                OnboardingView(onFinish: router.finishOnboarding)
            case .auth:
                AuthFlowView()
            case .main:
                Text("MainTab")
           
            }
        }
        .task {
            await router.start()
        }
        
    }
}
