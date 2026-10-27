//
//  PinService.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import Foundation

@Observable
final class PinService {
    private let keychain: KeychainHelper

    init(keychain: KeychainHelper = KeychainHelperImpl()) {
        self.keychain = keychain
    }

    var hasPin: Bool {
        !keychain.readString(key: .pinCode).isEmpty
    }

    func savePin(_ pin: String) {
        keychain.saveString(key: .pinCode, value: pin)
    }

    func verify(_ pin: String) -> Bool {
        keychain.readString(key: .pinCode) == pin
    }

    func deletePin() {
        keychain.delete(key: .pinCode)
    }
}
