//
//  SignUpSuccessView.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI

struct SignUpSuccessView: View {
    @Environment(AppRouter.self) private var appRouter

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Image(.success)
                .resizable()
                .scaledToFit()
                .frame(width: 160)

            Text("Congratulation!")
                .appText(.h3, color: .gray900, alignment: .center)
                .padding(.top, 40)

            Text("your account is complete, please enjoy the best menu from us.")
                .appText(.body16, color: .gray500, alignment: .center)
                .padding(.top, 8)

            AppButton(title: "Get Started", height: 48) {
                appRouter.didLogin()
            }
            .padding(.top, 40)

            Spacer()
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpSuccessView()
        .environment(AppRouter())
}
