//
//  AuthFlowView.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

struct AuthFlowView: View {
    @State private var authRouter = AuthRouter()
    var body: some View {
        NavigationStack(path: $authRouter.path) {
            SignInView()
                .navigationDestination(for: AuthRoute.self) { destination in
                    switch destination {
                    case .signUp:
                        SignUpView()
                    case .forgotPassword:
                        ForgotPasswordView()
                    }
                }
        }
        .environment(authRouter)
    }
}
