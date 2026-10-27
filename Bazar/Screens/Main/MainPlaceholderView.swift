//
//  MainPlaceholderView.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI


struct MainPlaceholderView: View {
    @Environment(AppRouter.self) private var appRouter

    var body: some View {
        VStack(spacing: 24) {
            Text("Main")
                .appText(.h3, color: .gray900)

            AppButton(title: "Logout", style: .secondary, height: 48) {
                appRouter.logout()
            }
        }
        .padding(24)
    }
}

#Preview {
    MainPlaceholderView()
        .environment(AppRouter())
}
