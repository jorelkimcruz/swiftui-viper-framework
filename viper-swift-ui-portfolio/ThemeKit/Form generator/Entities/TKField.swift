//
//  TKField.swift
//  viper-swift-ui-portfolio
//
//  Created by MAC HOME on 8/10/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//
//
import SwiftUI
import Combine

enum FieldType {
    case text
    case password
}

class TKField {
    @Published var value: String = ""
    
    var id = UUID()
    @Published  var type: FieldType = .text
    @Published  var placeholder: String = ""
    @Published  var label: String = ""
    
    init(value: String = "", type: FieldType = .text, placeholder: String = "", label: String = "") {
        self.label = label
        self.placeholder = placeholder
        self.type = type
        self.value = value
        
    }
    
}

extension TKField: ObservableObject {}
