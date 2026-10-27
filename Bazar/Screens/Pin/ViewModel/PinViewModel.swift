//
//  PinViewModel.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import Foundation

enum PinMode {
    case create
    case unlock
}

@Observable
final class PinViewModel {
    let mode: PinMode
    let pinLength = 4

    var pin = ""
    var errorMessage: String?

    private var firstPin: String?

    init(mode: PinMode) {
        self.mode = mode
    }

    var isConfirming: Bool {
        firstPin != nil
    }

    var title: String {
        switch mode {
        case .create:
            isConfirming ? "Confirm PIN" : "Create PIN"
        case .unlock:
            "Enter PIN"
        }
    }

    var subtitle: String {
        switch mode {
        case .create:
            isConfirming
                ? "Please enter your PIN again to confirm."
                : "Create a 4-digit PIN to quickly and securely access your account."
        case .unlock:
            "Please enter your 4-digit PIN to continue."
        }
    }


    func addDigit(_ digit: String) {
        guard pin.count < pinLength else { return }
        errorMessage = nil
        pin.append(digit)
    }

    func deleteDigit() {
        guard !pin.isEmpty else { return }
        pin.removeLast()
    }

    func submit(using pinService: PinService, onSuccess: () -> Void) {
        guard pin.count == pinLength else { return }

        switch mode {
        case .create:
            handleCreate(using: pinService, onSuccess: onSuccess)
        case .unlock:
            handleUnlock(using: pinService, onSuccess: onSuccess)
        }
    }

    private func handleCreate(using pinService: PinService, onSuccess: () -> Void) {
        guard let firstPin else {
            self.firstPin = pin
            pin = ""
            errorMessage = nil
            return
        }

        if pin == firstPin {
            pinService.savePin(pin)
            onSuccess()
        } else {
            self.firstPin = nil
            pin = ""
            errorMessage = "PINs do not match. Please try again."
        }
    }

    private func handleUnlock(using pinService: PinService, onSuccess: () -> Void) {
        if pinService.verify(pin) {
            onSuccess()
        } else {
            pin = ""
            errorMessage = "Wrong PIN. Please try again."
        }
    }
}
