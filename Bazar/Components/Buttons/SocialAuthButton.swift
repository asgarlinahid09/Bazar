//
//  SocialAuthButton.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

enum SocialProvider {
    case google
    case apple

    var title: String {
        switch self {
        case .google:
            "Sign in with Google"
        case .apple:
            "Sign in with Apple"
        }
    }

    var icon: ImageResource {
        switch self {
        case .google:
            .googleLogo
        case .apple:
            .appleLogo
        }
    }
}

struct SocialAuthButton: View {
    let provider: SocialProvider
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(provider.icon)
                    .fitted(maxSize: 16)
                Text(provider.title)
                    .appText(.body14, color: .gray900)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .contentShape(Capsule())
            .overlay {
                Capsule().stroke(.gray200, lineWidth: 1)
            }
        }
    }
}

#Preview {
    VStack(spacing: 8) {
        SocialAuthButton(provider: .google) {}
        SocialAuthButton(provider: .apple) {}
    }
    .padding(24)
}
