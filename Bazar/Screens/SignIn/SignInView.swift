//
//  SignInView.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

struct SignInView: View {
    @Environment(AuthRouter.self) private var authRouter
    var body: some View {
        VStack {
            Button("Sign Up") {
                authRouter.navigate(to: .signUp)
            }
            Button("Forgot Password") {
                authRouter.navigate(to: .forgotPassword)
            }
        }
    }
}

#Preview {
    SignInView()
}
