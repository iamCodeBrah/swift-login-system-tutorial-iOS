//
//  ServerResponses.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

struct SucessResponse: Decodable {
    let success: String
}

struct ErrorResponse: Decodable {
    let error: String
}
