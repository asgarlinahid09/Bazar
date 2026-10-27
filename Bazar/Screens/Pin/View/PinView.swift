//
//  PinView.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI

struct PinView: View {
    @Environment(AppRouter.self) private var appRouter
    @Environment(PinService.self) private var pinService

    @State private var viewModel: PinViewModel

    init(mode: PinMode) {
        self.viewModel = PinViewModel(mode: mode)
    }
    var body: some View {
        VStack(spacing: 0) {
            content

            Spacer(minLength: 24)

            NumberPad(
                onDigit: { viewModel.addDigit($0) },
                onDelete: { viewModel.deleteDigit() }
            )
        }
        .animation(.easeInOut(duration: 0.2), value: viewModel.title)
        .onChange(of: viewModel.pin) { _, newValue in
            guard newValue.count == viewModel.pinLength else { return }
            viewModel.submit(using: pinService) {
                appRouter.didFinishPin()
            }
        }
    }

    private var content: some View {
        VStack(spacing: 0) {
            AuthHeaderView(
                title: viewModel.title,
                subtitle: viewModel.subtitle,
                alignment: .center
            )

            PinCodeField(code: viewModel.pin, length: viewModel.pinLength)
                .padding(.top, 40)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .appText(.body14, color: .error, alignment: .center)
                    .padding(.top, 24)
            }

            if viewModel.mode == .unlock {
                AuthFooterLink(text: "Forgot PIN?", linkTitle: "Log out") {
                    appRouter.logout()
                }
                .padding(.top, 24)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 72)
    }
}

#Preview("Create") {
    PinView(mode: .create)
        .environment(AppRouter())
        .environment(PinService())
}

#Preview("Unlock") {
    PinView(mode: .unlock)
        .environment(AppRouter())
        .environment(PinService())
}
