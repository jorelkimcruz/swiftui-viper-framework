//
//  TKTextField.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI
enum FieldState {
    case error
    case normal
}
struct TKTextField: View {
    var label: String
    
    @Binding var text: String
    
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var secured: Bool = false
    
    @State private var hasFocus: Bool = false
    @State private var _hidePassword: Bool = true
    @State private var state: FieldState = .normal
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Group {
                    Text(self.label.uppercased())
                        .foregroundColor(Color(Asset.Colors.gray8D8F94.name))
                        + Text(label.isEmpty ? "" : "*")
                            .foregroundColor(Color(Asset.Colors.darkGreen.name))
                } .aspectRatio(contentMode: .fit)
                    .font(
                        .custom(FontFamily.BrandonGrotesque.medium.name,
                                size: 14))
                Spacer()
            }
            ZStack(alignment: .leading) {
                if secured {
                    HStack(spacing: 0) {
                        if _hidePassword {
                            TKPasswordField(text: $text, editingChanged: { (changed) in
                                self.hasFocus = changed
                            }, commit: {
                                self.hasFocus = false
                            },textStyle: FontFamily.BrandonGrotesque.regular
                                .font(size: 14))
                                .defaultFieldModifier()
                            
                        } else {
                            TextField("", text: $text, onEditingChanged: { (changed) in
                                self.hasFocus = changed
                            }, onCommit: {
                                self.hasFocus = false
                            }).defaultFieldModifier()
                        }
                        
                        ZStack {
                            Color.white.aspectRatio(contentMode: .fit)
                            Button(action: {
                                self.hasFocus = false
                                self._hidePassword.toggle()
                            }) {
                                ZStack{
                                    Image(systemName:
                                        _hidePassword ?
                                            "eye" :
                                        "eye.slash" )
                                        .renderingMode(.template)
                                        .foregroundColor(Color(Asset.Colors.gray53565C.name))
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                                }
                            }
                        }
                        
                    }.defaultBorderModifier(hasFocus: hasFocus, state: state)
                } else {
                    TextField("", text: $text, onEditingChanged: { (changed) in
                        self.hasFocus = changed
                    }, onCommit: {
                        self.hasFocus = false
                    }).defaultFieldModifier().defaultBorderModifier(hasFocus: hasFocus, state: state)
                    
                }
            }
            
        }.frame(maxWidth: UIScreen.main.bounds.width * 0.85)
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
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
            .padding(.all, 11).background(Color.white)
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
        return content.overlay(
            Rectangle()
                .stroke(
                    Color(
                        state == .error ? Asset.Colors.red.name :
                            hasFocus ? Asset.Colors.instructionBlack.name : Asset.Colors.lightGray.name ),
                    lineWidth: 1))
            .frame(height: UIScreen.main.bounds.height * 0.046)
    }
}



fileprivate struct TKTextFieldPreview: View {
    @State private var name: String = "emmanuelle.concepcion@gmail.com"
    @State private var nam2: String = ""
    
    var body: some View {
        VStack {
            TKTextField(label: "EMAIL", text: $name)
            TKTextField(label: "EMAIL", text: $nam2)
            TKTextField(label: "PASSWORD", text: $name, secured: true)
        }.background(Image(Asset.Image.bg.name))
    }
}

struct TKTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            TKTextFieldPreview()
        }
    }
}
