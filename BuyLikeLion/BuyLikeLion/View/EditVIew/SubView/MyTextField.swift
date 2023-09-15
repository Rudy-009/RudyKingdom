//
//  MyTextField.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/15.
//

import SwiftUI



extension Color {
    static let textFieldBack: Color = Color(uiColor: .secondarySystemBackground)
    static let placeholder: Color = Color(.placeholderText).opacity(2.0)
}


typealias Field = EditTextField.Field
struct EditTextField: View {
    
    enum Field: Hashable {
        case title
        case author
        case publisher
        case price
        case postContent
        case none
    }
    
    let title: String
    let placeHolder: String
    @Binding var text: String
    
    var focusField: FocusState<Field?>.Binding
    
    var filed: Field
    var body: some View {
        VStack(alignment: .leading){
            Text("\(title)")
                .font(.system(.title3))
                .bold()
            ZStack(alignment: .leading) {
                if self.text.isEmpty {
                    VStack {
                        Text("\(placeHolder)")
                            .foregroundColor(Color.placeholder)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                        Spacer()
                    }
                }
                TextField("", text: $text)
                    .focused(focusField , equals: filed)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.textFieldBack))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    .opacity(text.isEmpty ? 0.1 : 0.7 )
                    .textFieldStyle(MyTextFieldStyle())
                    .onSubmit {
                        focusChange()
                    }
            }
        }
    }
    
    func focusChange() {
        switch focusField.wrappedValue {
        case .title:
            focusField.wrappedValue = .author
        case .postContent:
            break
        case .author:
            focusField.wrappedValue = .publisher
        case .publisher:
            focusField.wrappedValue = .price
        case .price:
            focusField.wrappedValue = nil
        case nil:
            break
        case .some(.none):
            break
        }
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .tint(Color(.black))
    }
}
