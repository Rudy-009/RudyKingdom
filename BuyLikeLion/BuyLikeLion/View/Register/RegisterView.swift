//
//  RegisterView.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/15.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rePassword: String = ""
    
    @State var isShowingProgressView = false
    @State var isPasswordCountError: Bool = false
    @State var isPasswordUnCorrectError: Bool = false
    @State var isShowingSignUpAlert: Bool = false
    
    @EnvironmentObject var registerViewModel: RegisterViewModel
    // 회원가입 완료 버튼을 누르면 View가 자동으로 NavigationStack에서 pop되어 이전 View로 이동
    @Environment(\.dismiss) private var dismiss
    
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
                    
                    SecureField("비밀번호", text: $password)
                        .textFieldStyle(RegisterTextStyle())
                        .padding(.bottom, 10)
                    
//                    Text("비밀번호는 6자리 이상 입력해주세요.")
//                        .font(.system(size: 15))
//                        .foregroundColor(isPasswordCountError ? .red : .clear)
                    
                    if rePassword != password {
                        SecureField("비밀번호 재입력", text: $rePassword)
                            .textFieldStyle(RegisterTextStyle())
                            .overlay(RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color(.red), lineWidth: 0.5))
                        
//                        Text("비밀번호가 일치하지 않습니다.")
//                            .font(.system(size: 15))
//                            .foregroundColor(isPasswordUnCorrectError ? .red : .clear)
                    } else {
                        SecureField("비밀번호 재입력", text: $rePassword)
                            .textFieldStyle(RegisterTextStyle())
                            .padding(.bottom, 20)
                    }
                    
                    if checkSignUpCondition() {
                        CustomButton(buttonText: "회원가입", buttonTextColor: .white, buttonColor: .black, action: {
                            isShowingSignUpAlert = true
                        })
                        .alert("회원가입", isPresented: $isShowingSignUpAlert) {
                            Button {
                            } label: {
                                Text("OK")
                            }
                        } message: {
                            Text("회원가입이 완료되었습니다.")
                        }
                    } else {
                        CustomButton(buttonText: "회원가입", buttonTextColor: .gray, buttonColor: .white, action: {})
                            .disabled(true)
                    }
                    
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
    
    func checkSignUpCondition () -> Bool {
        if userName.isEmpty || email.isEmpty || password.isEmpty || rePassword.isEmpty {
            return false
        }
        return true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
