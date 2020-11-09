//
//  CustomTextField.swift
//  calculator
//
//  Created by Bradley on 7/11/20.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = {}
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit).textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
