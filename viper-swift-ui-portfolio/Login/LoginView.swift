//
//  LoginView.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .center) {
                    Image(Asset.Image.group6665.name).resizable()
                    Image(Asset.Image.group6663.name)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding(.top )
                }.frame(height: geometry.size.height * 0.30)
                ZStack() {
                    Image(Asset.Image.bg.name).resizable()
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: geometry.size.height * 0.02)
                        VStack(spacing: geometry.size.height * 0.02) {
                            TKTextField(label: "EMAIL", text: self.$presenter.email)
                            TKTextField(label: "Password", text: self.$presenter.password, secured: true)
                        }
                        Spacer()
                            .frame(height: geometry.size.height * 0.04)
                        HStack() {
                            Button(action: {
                                // What to perform
                            }) {
                                Text("Forgot your password?").foregroundColor(Color(Asset.Colors.gray53565C.name)).font(.custom(FontFamily.BrandonGrotesque.boldItalic.name, size: 16))
                            }
                            Spacer()
                            Button(action: {
                                // What to perform
                            }) {
                                ZStack{
                                    Color(Asset.Colors.gray53565C.name)
                                    Text("LOGIN").foregroundColor(.white)
                                }
                            }.frame(width: 132, height: 45)
                                .cornerRadius(5)
                                .shadow(color: Color(Asset.Colors.gray8D8F94.name), radius: 8, x: 0, y: 0)
                        }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                        VStack(alignment: .center) {
                            Spacer()
                            HStack(alignment: .center) {
                                VStack { Divider().background(Color(Asset.Colors.gray53565C.name)) }.padding(32)
                                Text("OR").font(.custom(FontFamily.BrandonGrotesque.regular.name, size: 16))
                                VStack { Divider().background(Color(Asset.Colors.gray53565C.name)) }.padding(32)
                            }
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    Image(Asset.Image.facebookbutton.name).renderingMode(.original).scaledToFit()
                                    Text("LOGIN WITH FACEBOOK")
                                        .foregroundColor(.white)
                                        .frame(height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 0))
                                        .font(.custom(FontFamily.NeutraText.book.name, size: 14))
                                }
                                
                            }
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    Image(Asset.Image.googleButton.name).renderingMode(.original)
                                    Text("LOGIN WITH GOOGLE")
                                        .foregroundColor(.white)
                                        .frame(height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 0))
                                        .font(.custom(FontFamily.NeutraText.book.name, size: 14))
                                }
                                
                            }
                            HStack {
                                Text("Not yet a member?")
                                    .foregroundColor(Color(Asset.Colors.gray53565C.name))
                                    .frame(height: 45)
                                    .font(.custom(FontFamily.BrandonGrotesque.regular.name, size: 14))
                                Button(action: {
                                    
                                }) {
                                    ZStack {
                                        Text("Sign up now.")
                                            .foregroundColor(Color(Asset.Colors.gray53565C.name))
                                            .frame(height: 45)
                                            .font(.custom(FontFamily.BrandonGrotesque.boldItalic.name, size: 14))
                                    }
                                    
                                }
                                
                            }
                            Spacer()
                        }
                    }
                    
                }
            }.edgesIgnoringSafeArea(.all).onAppear { UIApplication.setStatusBarStyle(.lightContent) }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor)
        return LoginView(presenter: presenter)
    }
}
