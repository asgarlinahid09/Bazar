//
//  OnboardingView.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

struct OnboardingView: View {
    let onFinish: () -> Void

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
        Button {
            onFinish()
        } label: {
            Text("Skip")
                .font(.robotoMedium(14))
                .foregroundStyle(.primary500)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .contentShape(Rectangle())
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
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 320, maxHeight: 320)
                .padding(.top, 13)

            Text(page.title)
                .font(.openSansBold(24, relativeTo: .title))
                .foregroundStyle(.gray900)
                .multilineTextAlignment(.center)
                .padding(.top, 14)

            Text(page.description)
                .font(.robotoRegular(16))
                .foregroundStyle(.gray500)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .frame(maxWidth: 292)
                .padding(.top, 11)
        }
        .padding(.horizontal, 24)
    }


    private var buttons: some View {
        VStack(spacing: 8) {
            Button {
                continueTapped()
            } label: {
                Text(isLastPage ? "Get Started" : "Continue")
                    .font(.openSansBold(16))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(.primary500, in: RoundedRectangle(cornerRadius: 12))
            }

            Button {
                onFinish()
            } label: {
                Text("Sign in")
                    .font(.openSansBold(16))
                    .foregroundStyle(.primary500)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(.primary50, in: RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(.horizontal, 24)
    }

    private func continueTapped() {
        if isLastPage {
            onFinish()
        } else {
            withAnimation {
                currentPage += 1
            }
        }
    }
}

#Preview {
    OnboardingView(onFinish: {})
}
