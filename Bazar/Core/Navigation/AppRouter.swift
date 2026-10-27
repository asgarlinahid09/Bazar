//
//  AppRouter.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

enum AppFlow {
    case splash
    case onboarding
    case auth
    case createPin
    case enterPin
    case main
}

@Observable
final class AppRouter {
    var flow: AppFlow = .splash

    private let authService: AuthService
    private let pinService: PinService
    private let userDefaults: UserDefaultsHelper

    init(
        authService: AuthService = AuthService(),
        pinService: PinService = PinService(),
        userDefaults: UserDefaultsHelper = UserDefaultsHelperImpl()
    ) {
        self.authService = authService
        self.pinService = pinService
        self.userDefaults = userDefaults
    }


    func start() async {
        try? await Task.sleep(for: .seconds(1.5))
        resetIfFirstLaunch()
        resolveFlow()
    }

    private func resetIfFirstLaunch() {
        let hasLaunchedBefore: Bool = userDefaults.get(key: .hasLaunchedBefore)
        guard !hasLaunchedBefore else { return }

        try? authService.signOut()
        pinService.deletePin()
        userDefaults.save(key: .hasLaunchedBefore, value: true)
    }

    private func resolveFlow() {
        let hasSeenOnboarding: Bool = userDefaults.get(key: .hasSeenOnboarding)

        if authService.isLoggedIn {
            flow = pinService.hasPin ? .enterPin : .createPin
        } else if hasSeenOnboarding {
            flow = .auth
        } else {
            flow = .onboarding
        }
    }


    func finishOnboarding() {
        userDefaults.save(key: .hasSeenOnboarding, value: true)
        change(to: .auth)
    }

    func didLogin() {
        change(to: pinService.hasPin ? .enterPin : .createPin)
    }

    func didFinishPin() {
        change(to: .main)
    }

    func logout() {
        try? authService.signOut()
        pinService.deletePin()
        change(to: .auth)
    }

    private func change(to newFlow: AppFlow) {
        withAnimation {
            flow = newFlow
        }
    }
}
