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
                OnboardingView()
            case .auth:
                AuthFlowView()
            case .createPin:
                PinView(mode: .create)
            case .enterPin:
                PinView(mode: .unlock)
            case .main:
                MainPlaceholderView()
            }
        }
        .task {
            await router.start()
        }
    }
}
