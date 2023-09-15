//
//  TextFieldStyle.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import SwiftUI

struct CustomTextField: View {
    
    @State private var title: String = "Custom TextField"
    
    var body: some View {
        TextField("Register TextField", text: $title)
                        .textFieldStyle(RegisterTextStyle())
    }
}

struct RegisterTextStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 300, height: 20)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8.0)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color(.systemGray4), lineWidth: 0.5))
        }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
