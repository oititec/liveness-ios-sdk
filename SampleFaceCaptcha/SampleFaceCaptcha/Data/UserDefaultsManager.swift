//
//  UserDefaultsManager.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 15/09/21.
//

import Foundation

class UserDefaultsManager {
    
    enum Key: String {
        case baseURL
        case username
        case token
        case name
        case cpf
        case birthday
    }
    
    func saveString(value: String?, forKey key: Key) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }

    func getString(forKey: Key) -> String? {
        UserDefaults.standard.string(forKey: forKey.rawValue)
    }
}
