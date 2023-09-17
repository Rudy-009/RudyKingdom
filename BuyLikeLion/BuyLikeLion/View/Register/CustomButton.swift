//
//  CustomButton.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import SwiftUI

struct CustomButton: View {
    
    @State var buttonText: String
    @State var buttonTextColor: Color
    @State var buttonColor: Color
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(buttonText)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(buttonTextColor)
            }
            .frame(width: 300, height: 20)
            .padding()
            .background(buttonColor)
            .cornerRadius(8.0)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color(.systemGray4), lineWidth: 0.5))
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonText: "회원가입", buttonTextColor: .white, buttonColor: .black, action: {})
    }
}
