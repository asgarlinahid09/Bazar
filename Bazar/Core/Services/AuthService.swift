//
//  AuthService.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService {

    var isLoggedIn: Bool {
        Auth.auth().currentUser != nil
    }

    @discardableResult
    func signIn(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user
    }

    @discardableResult
    func signUp(name: String, email: String, password: String) async throws -> User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)

        let changeRequest = result.user.createProfileChangeRequest()
        changeRequest.displayName = name
        try? await changeRequest.commitChanges()

        return result.user
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }

    static func errorMessage(for error: Error) -> String {
        guard let code = AuthErrorCode(rawValue: (error as NSError).code) else {
            return error.localizedDescription
        }

        switch code {
        case .emailAlreadyInUse:
            return "This email is already in use."
        case .invalidEmail:
            return "Please enter a valid email address."
        case .weakPassword:
            return "Password should be at least 6 characters."
        case .invalidCredential, .wrongPassword, .userNotFound:
            return "Email or password is incorrect."
        case .tooManyRequests:
            return "Too many attempts. Please try again later."
        case .networkError:
            return "No internet connection."
        default:
            return error.localizedDescription
        }
    }
}
