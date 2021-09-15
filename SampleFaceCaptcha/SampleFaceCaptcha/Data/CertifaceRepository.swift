//
//  CertifaceRepository.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 15/09/21.
//

import Foundation

class CertifaceRepository {
    
    private let api: CertifaceAPI
    private let userDefaults = UserDefaultsManager()

    init(baseURL: String) {
        self.api = CertifaceAPI(baseURL: baseURL)
    }
    
    func authenticate(username: String,
                      password: String,
                      completion: @escaping (_ token: String?) -> Void) {
        
        api.authenticate(username: username,
                         password: password.MD5(),
                         completion: completion)
    }
    
    func generateAppKey(completion: @escaping (_ appKey: String?) -> Void) {
        
        guard
            let username = userDefaults.getString(forKey: .username),
            let token = userDefaults.getString(forKey: .token),
            let cpf = userDefaults.getString(forKey: .cpf),
            let name = userDefaults.getString(forKey: .name),
            let birthday = userDefaults.getString(forKey: .birthday)
        else {
            completion(nil)
            return
        }
        
        api.generateAppKey(username: username,
                           token: token,
                           cpf: cpf,
                           name: name,
                           birthday: birthday,
                           completion: completion)
    }
}
