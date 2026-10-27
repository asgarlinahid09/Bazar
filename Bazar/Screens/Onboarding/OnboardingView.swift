//
//  OnboardingView.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(AppRouter.self) private var appRouter

    @State private var currentPage = 0
    private let pages = OnboardingPage.pages

    private var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    var body: some View {
        VStack(spacing: 0) {
            skipButton
            pager
            PageIndicator(totalPages: pages.count, currentPage: currentPage)
                .padding(.top, 28)
            buttons
                .padding(.top, 32)
        }
        .padding(.bottom, 8)
    }


    private var skipButton: some View {
        AppTagButton(title: "Skip") {
            appRouter.finishOnboarding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.top, 16)
    }


    private var pager: some View {
        TabView(selection: $currentPage) {
            ForEach(pages) { page in
                pageContent(page)
                    .tag(page.id)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    private func pageContent(_ page: OnboardingPage) -> some View {
        VStack(spacing: 0) {
            Image(page.imageName)
                .fitted(maxSize: 320)
                .padding(.top, 13)

            Text(page.title)
                .appText(.h3 ,color: .gray900, alignment: .center)
                .padding(.top, 14)

            Text(page.description)
                .appText(.body16, color: .gray500, alignment: .center)
                .frame(maxWidth: 292)
                .padding(.top, 11)
        }
        .padding(.horizontal, 24)
    }


    private var buttons: some View {
        VStack(spacing: 8) {
            AppButton(title: isLastPage ? "Get Started" : "Continue") {
                continueTapped()
            }
            AppButton(title: "Sign in", style: .secondary) {
                appRouter.finishOnboarding()
            }
        }
        .padding(.horizontal, 24)
    }

    private func continueTapped() {
        if isLastPage {
            appRouter.finishOnboarding()
        } else {
            withAnimation {
                currentPage += 1
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environment(AppRouter())
}
