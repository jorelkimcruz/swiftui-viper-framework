//
//  LoginInteractor.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import Combine

class LoginInteractor {
    
    private let loginRequestBody: LoginBodyRequest = LoginBodyRequest()
    private var cancellables = Set<AnyCancellable>()
    
    var email: String { loginRequestBody.email }
    var emailPublisher: Published<String>.Publisher { loginRequestBody.$email }
    
    var password: String { loginRequestBody.password }
    var passwordPublisher: Published<String>.Publisher { loginRequestBody.$password }
    
    init () {
    }
    
    func setEmail(_ email: String) {
        loginRequestBody.email = email
    }
    
    func setPassword(_ password: String) {
        loginRequestBody.password = password
    }
    
}
