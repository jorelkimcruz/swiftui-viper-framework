//
//  LoginPresenter.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI
import Combine

class LoginPresenter: ObservableObject {
    
    private let interactor: LoginInteractor
    private var cancellables = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    let setEmail: Binding<String>
    let setPassword: Binding<String>
    
    init(interactor: LoginInteractor) {
        self.interactor = interactor
        
        setEmail = Binding<String>(
            get: { interactor.email},
            set: { interactor.setEmail($0)}
        )
        
        setPassword = Binding<String>(
            get: { interactor.password },
            set: { interactor.setPassword($0) }
        )
        
        interactor.emailPublisher
                          .assign(to: \.email, on: self)
                          .store(in: &cancellables)
        
        interactor.passwordPublisher
                    .assign(to: \.password, on: self)
                    .store(in: &cancellables)
    }
    
    func validate (){
        
    }
    
}
