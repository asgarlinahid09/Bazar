//
//  AuthHeaderView.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI
struct AuthHeaderView: View {
    let title: String
    let subtitle: String
    var alignment: HorizontalAlignment = .leading

    private var textAlignment: TextAlignment {
        alignment == .center ? .center : .leading
    }

    var body: some View {
        VStack(alignment: alignment, spacing: 8) {
            Text(title)
                .appText(.h3, color: .gray900, alignment: textAlignment)
            Text(subtitle)
                .appText(.body16, color: .gray500, alignment: textAlignment)
        }
        .frame(maxWidth: .infinity, alignment: Alignment(horizontal: alignment, vertical: .center))
    }
}

#Preview {
    VStack(spacing: 40) {
        AuthHeaderView(title: "Welcome Back 👋", subtitle: "Sign to your account")
        AuthHeaderView(
            title: "Verification Email",
            subtitle: "Please enter the code we just sent to email\nJohndoe@gmail.com",
            alignment: .center
        )
    }
    .padding(24)
}
