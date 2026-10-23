//
//  BazarApp.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

@main
struct BazarApp: App {

    @State private var appRouter: AppRouter
    
    init() {
        appRouter = AppRouter()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appRouter)
        }
    }
}
