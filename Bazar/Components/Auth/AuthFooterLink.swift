//
//  AuthFooterLink.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

struct AuthFooterLink: View {
    let text: String
    let linkTitle: String
    let action: () -> Void

    var body: some View {
        HStack(spacing: 4) {
            Text(text)
                .appText(.body16, color: .gray500)

            Button(action: action) {
                Text(linkTitle)
                    .appText(.body16, color: .primary500)
            }
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        AuthFooterLink(text: "Don’t have an account?", linkTitle: "Sign Up") {}
        AuthFooterLink(text: "Have an account?", linkTitle: "Sign In") {}
    }
}
