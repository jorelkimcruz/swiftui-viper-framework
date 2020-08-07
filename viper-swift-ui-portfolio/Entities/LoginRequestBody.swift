//
//  LoginRequestBody.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import Foundation

final class LoginBodyRequest {
    
    enum CodingKeys: CodingKey {
        case email
        case password
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary[CodingKeys.email.stringValue] = email
        dictionary[CodingKeys.password.stringValue] = password
        return dictionary
    }
}

extension LoginBodyRequest: Identifiable {}

extension LoginBodyRequest: ObservableObject {}
