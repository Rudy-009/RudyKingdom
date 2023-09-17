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
    @State var isShowingToast: Bool = false
    @State var toastMessage: String = ""
    @State var isEmailAvailable: Bool = true
    
    @EnvironmentObject var registerViewModel: RegisterViewModel
    @EnvironmentObject var userAuth: UserAuth
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("회원가입")
                    .font(.largeTitle)
                    .bold()
                    .padding(EdgeInsets(top: 35, leading: 30, bottom: 60, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Group {
                    TextField("이름", text: $userName)
                        .textFieldStyle(RegisterTextStyle())
                        .padding(.bottom, 10)
                    
                    TextField("이메일", text: $email)
                        .textFieldStyle(RegisterTextStyle())
                        .keyboardType(.emailAddress)
                        .padding(.bottom, 10)
                    
                    if !isEmailAvailable {
                        Text("이미 사용 중인 이메일입니다.")
                            .foregroundColor(.red)
                    }
                    
                    SecureField("비밀번호", text: $password)
                        .textFieldStyle(RegisterTextStyle())
                        .padding(.bottom, 10)
                    
                    if rePassword != password {
                        SecureField("비밀번호 재입력", text: $rePassword)
                            .textFieldStyle(RegisterTextStyle())
                            .overlay(RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color(.red), lineWidth: 0.5))
                    } else {
                        SecureField("비밀번호 재입력", text: $rePassword)
                            .textFieldStyle(RegisterTextStyle())
                            .padding(.bottom, 20)
                    }
                    
                    if checkSignUpCondition() && isEmailAvailable {
                        CustomButton(buttonText: "회원가입", buttonTextColor: .white, buttonColor: .black, action: {
                            registerViewModel.emailAuthSignUp(email: email, userName: userName, password: password)
                        })
                        .onChange(of: registerViewModel.signUpStatus) { newStatus in
                            if newStatus != nil {
                                toastMessage = newStatus == 1 ? "회원가입이 완료되었습니다." : "회원가입 실패"
                                isShowingToast = true
                                if newStatus == 1 {
                                    dismiss()
                                }
                            }
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
                
                if isShowingToast {
                    ToastView(message: toastMessage)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isShowingToast = false
                            }
                        }
                }
            }
            .onChange(of: email) { newValue in
                registerViewModel.checkEmailAvailability(email: newValue)
            }
            .onReceive(registerViewModel.$isEmailAvailable) { newValue in
                isEmailAvailable = newValue
            }
        }
    }
    
    func checkSignUpCondition() -> Bool {
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
