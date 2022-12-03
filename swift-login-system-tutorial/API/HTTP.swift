//
//  HTTP.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

enum HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        
        enum Key: String {
            case contentType = "Content-Type"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
        }
        
    }
    
}
