//
//  ContentView.swift
//  viper-swift-ui-portfolio
//
//  Created by MAC HOME on 8/7/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor)
        return LoginView(presenter: presenter)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = LoginInteractor(LoginBodyRequest(email: "sampleinput@gmail.com"))
        let presenter = LoginPresenter(interactor: interactor)
        return LoginView(presenter: presenter)
    }
}
#endif
