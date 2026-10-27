//
//  BazarApp.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI
import FirebaseCore

@main
struct BazarApp: App {
    @State private var authService: AuthService
    @State private var pinService: PinService
    @State private var appRouter: AppRouter

    init() {
        FirebaseApp.configure()

        let authService = AuthService()
        let pinService = PinService()

        self.authService = authService
        self.pinService = pinService
        self.appRouter = AppRouter(authService: authService, pinService: pinService)
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appRouter)
                .environment(authService)
                .environment(pinService)
        }
    }
}
