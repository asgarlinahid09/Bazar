//
//  KeychainHelper.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import Foundation

enum KeychainKey: String {
    case pinCode
}

protocol KeychainHelper {
    func saveString(key: KeychainKey, value: String)
    func readString(key: KeychainKey) -> String
    func delete(key: KeychainKey)
}

final class KeychainHelperImpl: KeychainHelper {

    func saveString(key: KeychainKey, value: String) {
        save(key: key.rawValue, value: value.data(using: .utf8) ?? Data())
    }

    func readString(key: KeychainKey) -> String {
        if let result = read(key: key.rawValue) {
            return String(data: result, encoding: .utf8) ?? ""
        }
        return ""
    }

    func delete(key: KeychainKey) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key.rawValue
        ]

        SecItemDelete(query as CFDictionary)
    }

    private func read(key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess {
            return result as? Data
        }
        return nil
    }

    private func save(key: String, value: Data) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key,
            kSecValueData as String: value
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
}
