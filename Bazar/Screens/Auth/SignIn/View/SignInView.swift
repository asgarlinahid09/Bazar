//
//  SignInView.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

struct SignInView: View {
    @Environment(AuthRouter.self) private var authRouter
    @Environment(AppRouter.self) private var appRouter
    @Environment(AuthService.self) private var authService

    @State private var viewModel = SignInViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                AuthHeaderView(
                    title: "Welcome Back 👋",
                    subtitle: "Sign to your account"
                )

                VStack(spacing: 16) {
                    AppTextField(
                        title: "Email",
                        placeholder: "Your email",
                        text: $viewModel.email
                    )
                    .keyboardType(.emailAddress)

                    AppTextField(
                        title: "Password",
                        placeholder: "Your password",
                        text: $viewModel.password,
                        isSecure: true
                    )

                    forgotPasswordButton
                }

                AppButton(
                    title: "Login",
                    height: 48,
                    isEnabled: viewModel.canSubmit,
                    isLoading: viewModel.isLoading
                ) {
                    Task {
                        await viewModel.signIn(using: authService) {
                            appRouter.didLogin()
                        }
                    }
                }

                AuthFooterLink(text: "Don’t have an account?", linkTitle: "Sign Up") {
                    authRouter.navigate(to: .signUp)
                }

                OrDivider()

                VStack(spacing: 8) {
                    SocialAuthButton(provider: .google) {
                        // Vaxt qalsa: Google Sign In
                    }
                    SocialAuthButton(provider: .apple) {
                        // Apple Sign In bu task-a daxil deyil
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 72)
        }
        .scrollDismissesKeyboard(.interactively)
        .alert("Error", isPresented: $viewModel.isShowingError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }

    private var forgotPasswordButton: some View {
        Button {
            authRouter.navigate(to: .forgotPassword)
        } label: {
            Text("Forgot Password?")
                .appText(.body14Medium, color: .primary500)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
    .environment(AuthRouter())
    .environment(AppRouter())
    .environment(AuthService())
}
