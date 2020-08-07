//
//  TKPasswordField.swift
//  viper-swift-ui-sample
//
//  Created by MAC HOME on 8/5/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//
import SwiftUI

struct TKPasswordField: UIViewRepresentable {
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    
    var commit: ()->() = { }
    var textStyle: UIFont
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = true
        textField.delegate = context.coordinator
        textField.font = textStyle
        textField.text = text
        textField.textContentType = .password
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        _ = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .compactMap {
                
                guard let field = $0.object as? UITextField else {
                    return nil
                }
                return field.text
        }
        .sink {
            self.text = $0
        }
        
        return textField
    }
    
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.font = textStyle
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TKPasswordField
        
        init(_ textField: TKPasswordField) {
            self.parent = textField
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let currentValue = textField.text as NSString? {
                let proposedValue = currentValue.replacingCharacters(in: range, with: string)
                self.parent.text = proposedValue
            }
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.parent.editingChanged(true)
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.parent.commit()
        }
    }
}
