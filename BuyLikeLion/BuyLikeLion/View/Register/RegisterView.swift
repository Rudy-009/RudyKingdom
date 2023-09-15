//
//  RegisterView.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rePassword: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("회원가입")
                    .font(.largeTitle)
                    .bold()
                    .padding(EdgeInsets(top: 35, leading: 30, bottom: 60, trailing: 0))                .frame(maxWidth: .infinity, alignment: .leading)
                
                Group {
                    TextField("이름", text: $userName)
                        .textFieldStyle(RegisterTextStyle())
                        .padding(.bottom, 10)
                    
                    TextField("이메일", text: $email)
                        .textFieldStyle(RegisterTextStyle())
                        .keyboardType(.emailAddress)
                        .padding(.bottom, 10)
                    
                    TextField("비밀번호", text: $password)
                        .textFieldStyle(RegisterTextStyle())
                        .padding(.bottom, 10)
                    
                    TextField("비밀번호 재입력", text: $rePassword)
//                        .textFieldStyle(RegisterTextField())
                        .padding(.bottom, 20)
                    
                    CustomButton(buttonText: "회원가입", action: {})
                        .padding(.bottom, 10)
                    
                    Spacer()
                    HStack {
                        Text("이미 계정이 있으신가요?")
                        
                        Button {
                            
                        } label: {
                            Text("로그인")
                        }
                    }
                    .padding(.bottom, 15)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .modifier(CustomNavigationBackButton())
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
