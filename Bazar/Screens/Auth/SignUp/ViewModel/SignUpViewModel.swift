//
//  SignUpViewModel.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import Foundation

@Observable
final class SignUpViewModel {
    var name = ""
    var email = ""
    var password = ""

    var isLoading = false
    var isShowingError = false
    var errorMessage = ""


    var hasMinLength: Bool {
        password.count >= 8
    }

    var hasNumber: Bool {
        password.contains(where: \.isNumber)
    }

    var hasLetter: Bool {
        password.contains(where: \.isLetter)
    }

    var isPasswordValid: Bool {
        hasMinLength && hasNumber && hasLetter
    }

    var canSubmit: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
            && !email.trimmingCharacters(in: .whitespaces).isEmpty
            && isPasswordValid
    }


    func signUp(using authService: AuthService, onSuccess: () -> Void) async {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty, !trimmedEmail.isEmpty, !password.isEmpty else {
            presentError("Please fill in all fields.")
            return
        }

        guard isPasswordValid else {
            presentError("Password does not meet the requirements.")
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            try await authService.signUp(name: trimmedName, email: trimmedEmail, password: password)
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
