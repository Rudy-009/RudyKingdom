//
//  CustomNavigationBackButton.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import Foundation
import SwiftUI

struct CustomNavigationBackButton: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                    }
                    .frame(width: 10, height: 10)
                    .padding()
                    .background(.clear)
                    .cornerRadius(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color(.systemGray4), lineWidth: 0.5))
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden()
    }
}
