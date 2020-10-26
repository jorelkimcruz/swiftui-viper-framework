//
//  TKFormGenerator.swift
//  viper-swift-ui-portfolio
//
//  Created by MAC HOME on 8/10/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI
import Combine

struct TKFormGenerator: View {
    var fields = [TKField(placeholder: "", label: "email"),
                  TKField(type: .password, label: "password")]
    
    var body: some View {
        VStack {
            ForEach(fields, id: \.id) { field in
                self.buildTextField(field: field)
            }
        }
    }
    
    private func buildTextField(field: TKField) -> AnyView {
        switch field.type {
        case .password:
            return AnyView( TKTextField(label: field.label,placeholder: field.placeholder, text: field.value, secured: true) )
        default:
            return AnyView( TKTextField(label: field.label,placeholder: field.placeholder, text: field.value) )
        }
    }
    
}

#if DEBUG
struct TKFormGenerator_Previews: PreviewProvider {
    static var previews: some View {
        TKFormGenerator()
    }
}
#endif
