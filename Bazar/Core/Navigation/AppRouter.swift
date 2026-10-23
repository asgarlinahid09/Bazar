//
//  AppRouter.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import Foundation

enum AppFlow {
    case splash
    case onboarding
    case auth
    case main
}

@Observable
final class AppRouter {
    var flow: AppFlow = .splash
    private let hasSeenOnboardingKey = "hasSeenOnboarding"
    
    private var hasSeenOnboarding: Bool {
        get {UserDefaults.standard.bool(forKey: hasSeenOnboardingKey)}
        set {UserDefaults.standard.set(newValue, forKey: hasSeenOnboardingKey)}
    }
    
    func start() async {
        try? await Task.sleep(for: .seconds(1.5))
        resolveFlow()
    }
    
    private func resolveFlow() {
        if hasSeenOnboarding {
            flow = .auth
        } else {
            flow = .onboarding
        }
    }
    
    func finishOnboarding(){
        hasSeenOnboarding = true
        flow = .auth
    }
}
