//
//  UserDefaultsHelper.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import Foundation

protocol UserDefaultsHelper: AnyObject {
    func save(key: UserDefaultKey, value: String)
    func save(key: UserDefaultKey, value: Bool)

    func get(key: UserDefaultKey) -> String
    func get(key: UserDefaultKey) -> Bool

    func remove(key: UserDefaultKey)
}

final class UserDefaultsHelperImpl: UserDefaultsHelper {
    private let userDefaults: UserDefaults = .standard

    func save(key: UserDefaultKey, value: String) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func save(key: UserDefaultKey, value: Bool) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func get(key: UserDefaultKey) -> String {
        userDefaults.string(forKey: key.rawValue) ?? ""
    }

    func get(key: UserDefaultKey) -> Bool {
        userDefaults.bool(forKey: key.rawValue)
    }

    func remove(key: UserDefaultKey) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

