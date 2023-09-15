//
//  CustomButton.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import SwiftUI

struct CustomButton: View {
    
    @State var buttonText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(buttonText)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
            }
            .frame(width: 300, height: 20)
            .padding()
            .background(.black)
            .cornerRadius(8.0)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonText: "회원가입", action: {})
    }
}
