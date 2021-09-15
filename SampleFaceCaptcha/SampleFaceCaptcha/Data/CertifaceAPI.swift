//
//  CertifaceAPI.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 15/09/21.
//

import Foundation
import CryptoKit

typealias CertifaceAPICallback = (_ value: Data?, _ error: Error?) -> Void

class CertifaceAPI {
    
    private let baseURL: String
    private let defaultHeaders = [
        "Accept": "application/json",
        "cache-control": "no-cache",
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Access-Control-Allow-Origin": "*"
    ]
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func authenticate(username: String,
                      password: String,
                      completion: @escaping (_ token: String?) -> Void) {

        let endpoint = "/facecaptcha/service/captcha/credencial"
        var request = createURLRequest(endpoint: endpoint, httpMethod: "POST")

        let parameters = [
            "user":"\(username)",
            "pass":"\(password)"
        ]
        
        let bodyData = parameters.stringFromHttpParameters()
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        perforRequest(request: request) { data, error in
            if let data = data {
                completion(String(data: data, encoding: .utf8))
            } else {
                completion(nil)
            }
        }
    }
    
    func generateAppKey(username: String,
                        token: String,
                        cpf: String,
                        name: String,
                        birthday: String,
                        completion: @escaping (_ appKey: String?) -> Void) {

        let endpoint = "/facecaptcha/service/captcha/appkey"
        var request = createURLRequest(endpoint: endpoint, httpMethod: "POST")

        let parameters = [
            "user":"\(username)",
            "token":"\(token)",
            "cpf":"\(cpf)",
            "nome":"\(name)",
            "nascimento":"\(birthday)"
        ]
        
        let bodyData = parameters.stringFromHttpParameters()
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        perforRequest(request: request) { data, _ in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(AppKeyResponse.self, from: data)
                    completion(response.appkey)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    private func createURLRequest(endpoint: String, httpMethod: String) -> URLRequest {

        let url = URL(string: "\(baseURL)\(endpoint)")!

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = defaultHeaders

        return request
    }
    
    private func perforRequest(request: URLRequest, completion: @escaping CertifaceAPICallback) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dt = data else { completion(nil, error); return }
            completion(dt, nil)
        }
        task.resume()
    }
}

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = map { key, value -> String in
            let percentEscapedKey = (key as? String)?.addingPercentEncodingForURLQueryValue()
            let percentEscapedValue = (value as? String)?.addingPercentEncodingForURLQueryValue()
            return "\(percentEscapedKey ?? "")=\(percentEscapedValue ?? "")"
        }
        
        return parameterArray.joined(separator: "&")
    }
}

extension String {
    
    func addingPercentEncodingForURLQueryValue() -> String? {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)
        
        return addingPercentEncoding(withAllowedCharacters: allowed)
    }
    
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
