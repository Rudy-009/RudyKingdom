//
//  EditTextEditor.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/15.
//

import SwiftUI
import UIKit

struct EditTextEditor: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("게시글의 내용")
                .font(.system(.title3))
                .bold()
        
            ZStack(alignment: .leading) {
                if self.text.isEmpty {
                    VStack {
                        Text("게시글의 내용을 입력해주세요")
                            .padding(.top, 8)
                            .foregroundColor(Color.placeholder)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                TextEditor(text: self.$text)
                    .lineSpacing(5) //줄 간격4
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.textFieldBack))
                    .padding(.leading, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 120)
                    .opacity(self.text.isEmpty ? 0.1 : 0.7 )
                    .textFieldStyle(MyTextFieldStyle())
            }.frame(height: 120)
        }
    }
}
