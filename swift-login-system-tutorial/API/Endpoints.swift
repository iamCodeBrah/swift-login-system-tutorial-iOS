//
//  Endpoints.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

enum Endpoint {
    
    case createAccount(path: String = "/auth/create-account", userRequest: RegisterUserRequest)
    case signIn(path: String = "/auth/sign-in", userRequest: SignInUserRequest)
    case forgotPassword(path: String = "/auth/forgot-password", email: String)
    
    case getData(path: String = "/data/get-data")
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.addValues(for: self)
        request.httpBody = self.httpBody
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        return components.url
    }
    
    private var path: String {
        switch self {
        case .createAccount(let path, _),
                .signIn(let path, _),
                .forgotPassword(let path, _),
                .getData(let path):
            return path
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .createAccount,
                .signIn,
                .forgotPassword:
            return HTTP.Method.post.rawValue
        case .getData:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .createAccount(_, let userRequest):
            return try? JSONEncoder().encode(userRequest)
            
        case .signIn(_, let userRequest):
            return try? JSONEncoder().encode(userRequest)
            
        case .forgotPassword(_, let email):
            return try? JSONSerialization.data(withJSONObject: ["email": email], options: [])
            
        case .getData:
            return nil
        }
    }
    
}

extension URLRequest {
    
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .createAccount,
                .signIn,
                .forgotPassword,
                .getData:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
