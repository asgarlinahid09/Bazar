//
//  SignInViewModel.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import Foundation

@Observable
final class SignInViewModel {
    var email = ""
    var password = ""

    var isLoading = false
    var isShowingError = false
    var errorMessage = ""

    var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.isEmpty
    }

    func signIn(using authService: AuthService, onSuccess: () -> Void) async {
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)

        guard !trimmedEmail.isEmpty, !password.isEmpty else {
            presentError("Please enter your email and password.")
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            try await authService.signIn(email: trimmedEmail, password: password)
            onSuccess()
        } catch {
            presentError(AuthService.errorMessage(for: error))
        }
    }

    private func presentError(_ message: String) {
        errorMessage = message
        isShowingError = true
    }
}
