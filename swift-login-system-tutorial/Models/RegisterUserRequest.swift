//
//  RegisterUserRequest.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

struct RegisterUserRequest: Codable {
    let email: String
    let username: String
    let password: String
}
