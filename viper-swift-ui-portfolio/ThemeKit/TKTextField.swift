//
//  TKTextField.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI
enum FieldState {
    case error(error: String)
    case normal
}
struct TKTextField: View {
    var label: String
    var placeholder: String?
    
    @State var text: String
    
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var secured: Bool = false
    
    @State private var hasFocus: Bool = false
    @State var state: FieldState = .normal
    @State var hidePassword: Bool = true
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Group {
                    Text(self.label.uppercased())
                        .foregroundColor(Color(Asset.Colors.gray53565C.name))
                        + Text(label.isEmpty ? "" : "*")
                            .foregroundColor(Color(Asset.Colors.red.name))
                } .aspectRatio(contentMode: .fit)
                    .font(
                        .custom(FontFamily.BrandonGrotesque.medium.name,
                                size: 14))
                Spacer()
            }
            ZStack(alignment: .leading) {
                if secured {
                    HStack(spacing: 0) {
                        if hidePassword {
                            HStack {
                                Spacer()
                                TKPasswordField(text: $text, editingChanged: { (changed) in
                                    self.hasFocus = changed
                                }, commit: {
                                    self.hasFocus = false
                                },textStyle: FontFamily.BrandonGrotesque.regular
                                    .font(size: 14), placeholder: self.placeholder ?? "")
                                    .defaultFieldModifier()
                            }
                            
                            
                        } else {
                            HStack {
                                Spacer()
                                TextField(self.placeholder ?? "", text: $text, onEditingChanged: { (changed) in
                                    self.hasFocus = changed
                                }, onCommit: {
                                    self.hasFocus = false
                                }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                Spacer()
                            }
                            .defaultFieldModifier()
                        }
                        
                        ZStack {
                            Color.white.aspectRatio(contentMode: .fit)
                            Button(action: {
                                self.hasFocus = false
                                self.hidePassword.toggle()
                            }) {
                                ZStack{
                                    Image(systemName:
                                        hidePassword ?
                                            "eye.slash" :
                                        "eye" )
                                        .renderingMode(.template)
                                        .foregroundColor(Color(Asset.Colors.gray53565C.name))
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                                }
                            }
                        }
                        
                    }.defaultBorderModifier(hasFocus: hasFocus, state: state)
                } else {
                    HStack {
                        Spacer()
                        TextField(self.placeholder ?? "", text: $text, onEditingChanged: { (changed) in
                            self.hasFocus = changed
                        }, onCommit: {
                            self.hasFocus = false
                        }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        Spacer()
                    }
                    .defaultFieldModifier()
                    .defaultBorderModifier(hasFocus: hasFocus, state: state)
                    
                    
                }
                Spacer()
            }
            
        }
    }
    
}

fileprivate extension View {
    func defaultFieldModifier() -> some View {
        self.modifier(fontModifier())
    }
    
    func defaultBorderModifier(hasFocus: Bool, state: FieldState) -> some View {
        self.modifier(borderModifier(hasFocus: hasFocus, state: state))
    }
}

fileprivate struct fontModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return content.font(.custom(FontFamily.BrandonGrotesque.regular.name, size: 14))
            .foregroundColor(Color(Asset.Colors.lightBlack1A1A1A.name))
        
    }
}

fileprivate struct borderModifier: ViewModifier {
    private var hasFocus: Bool = false
    private var state: FieldState = .normal
    
    init(hasFocus: Bool, state: FieldState) {
        self.hasFocus = hasFocus
        self.state = state
    }
    
    func body(content: Content) -> some View {
        var borderColor: Color;
        switch self.state {
        case .error(_):
            borderColor = Color(Asset.Colors.red.name);
        default:
            borderColor =  self.hasFocus ? Color(Asset.Colors.instructionBlack.name) :  Color(Asset.Colors.lightGray.name)
            
        }
        return content.overlay(
            Rectangle()
                .stroke(
                    borderColor,
                    lineWidth: 1))
            .background(Color.white)
            .frame(height: UIScreen.main.bounds.height * 0.046)
    }
}

#if DEBUG
fileprivate struct TKTextFieldPreview: View {
    @State private var email: String = "emmanuelle.concepcion@gmail.com"
    @State private var password: String = "123123123123123123123123123121231231231233123123123123123"
    @State private var empty: String = ""
    
    var body: some View {
        VStack {
            TKTextField(label: "EMAIL", text: email)
            TKTextField(label: "EMAIL", text: empty)
            TKTextField(label: "PASSWORD", text: password, secured: true)
            TKTextField(label: "PASSWORD", text: password, secured: true, hidePassword: false)
        }.background(Image(Asset.Image.bg.name)).padding(.leading, 32).padding(.trailing, 32)
    }
}
struct TKTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            TKTextFieldPreview()
        }
    }
}
#endif
