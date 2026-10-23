
//
//  OnboardingPage.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import Foundation

struct OnboardingPage: Identifiable {
    let id: Int
    let imageName: String
    let title: String
    let description: String

    static let pages: [OnboardingPage] = [
        OnboardingPage(
            id: 0,
            imageName: "onboarding1",
            title: "Now reading books \nwill be easier",
            description: "Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."
        ),
        OnboardingPage(
            id: 1,
            imageName: "onboarding2",
            title: "Your Bookish Soulmate \nAwaits",
            description: "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience."
        ),
        OnboardingPage(
            id: 2,
            imageName: "onboarding3",
            title: "Start Your Adventure",
            description: "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!"
        )
    ]
}
