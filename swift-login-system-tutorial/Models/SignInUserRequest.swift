//
//  SignInUserRequest.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

struct SignInUserRequest: Codable {
    let email: String
    let password: String
}
