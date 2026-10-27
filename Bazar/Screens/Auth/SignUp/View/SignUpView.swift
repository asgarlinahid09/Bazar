//
//  SignUpView.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

struct SignUpView: View {
    @Environment(AuthRouter.self) private var authRouter
    @Environment(AuthService.self) private var authService

    @State private var viewModel = SignUpViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                AuthHeaderView(
                    title: "Sign Up",
                    subtitle: "Create account and choose favorite menu"
                )

                VStack(alignment: .leading, spacing: 16) {
                    AppTextField(
                        title: "Name",
                        placeholder: "Your name",
                        text: $viewModel.name
                    )

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

                    if !viewModel.password.isEmpty {
                        passwordRules
                    }
                }
                .animation(.easeInOut(duration: 0.2), value: viewModel.password.isEmpty)

                VStack(spacing: 24) {
                    AppButton(
                        title: "Register",
                        height: 48,
                        isEnabled: viewModel.canSubmit,
                        isLoading: viewModel.isLoading
                    ) {
                        Task {
                            await viewModel.signUp(using: authService) {
                                authRouter.navigate(to: .signUpSuccess)
                            }
                        }
                    }

                    AuthFooterLink(text: "Have an account?", linkTitle: "Sign In") {
                        authRouter.navigateBack()
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
        }
        .scrollDismissesKeyboard(.interactively)
        .safeAreaInset(edge: .bottom) {
            termsText
        }
        .alert("Error", isPresented: $viewModel.isShowingError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }

    private var passwordRules: some View {
        VStack(alignment: .leading, spacing: 8) {
            PasswordRuleRow(text: "Minimum 8 characters", isValid: viewModel.hasMinLength)
            PasswordRuleRow(text: "At least 1 number (1-9)", isValid: viewModel.hasNumber)
            PasswordRuleRow(text: "At least lowercase or uppercase letters", isValid: viewModel.hasLetter)
        }
        .transition(.opacity)
    }

    private var termsText: some View {
        Text("By clicking Register, you agree to our \(Text("Terms and Data Policy.").foregroundStyle(.primary500))")
            .appText(.body14, color: .gray500, alignment: .center)
            .frame(maxWidth: 243)
            .padding(.bottom, 8)
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
    .environment(AuthRouter())
    .environment(AuthService())
}
