//
//  AppButton.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

enum AppButtonStyle {
    case primary
    case secondary

    var textColor: Color {
        switch self {
        case .primary:
            .white
        case .secondary:
            .primary500
        }
    }

    var backgroundColor: Color {
        switch self {
        case .primary:
            .primary500
        case .secondary:
            .primary50
        }
    }
}

struct AppButton: View {
    let title: String
    var style: AppButtonStyle = .primary
    var height: CGFloat = 56
    var isEnabled: Bool = true
    var isLoading: Bool = false
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                if isLoading {
                    ProgressView()
                        .tint(style.textColor)
                } else {
                    Text(title)
                        .appText(.h6, color: style.textColor)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(
                style.backgroundColor,
                in: RoundedRectangle(cornerRadius: 12)
            )
        }
        .disabled(!isEnabled || isLoading)
        .opacity(isEnabled ? 1 : 0.4)
        .animation(.easeInOut(duration: 0.2), value: isEnabled)
    }
}

#Preview {
    VStack(spacing: 8) {
        AppButton(title: "Continue") {}
        AppButton(title: "Sign in", style: .secondary) {}
        AppButton(title: "Login", height: 48) {}
        AppButton(title: "Login", height: 48, isEnabled: false) {}
        AppButton(title: "Login", height: 48, isLoading: true) {}
    }
    .padding(24)
}
