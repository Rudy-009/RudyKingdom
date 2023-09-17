//
// LoginView.swift
// BuyLikeLion
//
// Created by 박찬호 on 2023/09/16.

import SwiftUI
import FirebaseAuth

// 로그인 화면을 표시하는 View
struct LoginView: View {
    // 사용자 이메일과 비밀번호
    @State private var email: String = ""
    @State private var password: String = ""
    
    // 에러 메시지와 Alert 표시 여부
    @State private var errorMessage: String = ""
    @State private var isShowingLoginAlert: Bool = false
    
    // 비밀번호 표시 여부
    @State private var showPassword: Bool = false
    
    // 이메일 유효성 검사
    @State private var isEmailValid: Bool = true
    @State private var cautionEmail: String = ""
    
    // 이전 화면으로 돌아가기
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                // 로그인 제목
                Text("로그인")
                    .font(.largeTitle)
                    .bold()
                    .padding(EdgeInsets(top: 35, leading: 30, bottom: 60, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // 이메일, 비밀번호 입력 필드
                Group {
                    // 이메일 입력 필드
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .onChange(of: email, perform: { value in
                            isCheckEmail()
                        })
                        .textFieldStyle(RegisterTextStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(isEmailValid ? Color.clear : Color.red, lineWidth: isEmailValid ? 0 : 1)
                        )
                    
                    // 이메일 유효성 문구
                    Text(cautionEmail)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 35)
                    
                    // 비밀번호 입력 필드
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            TextField("비밀번호", text: $password)
                        } else {
                            SecureField("비밀번호", text: $password)
                        }
                        
                        // 비밀번호 보이기/숨기기 버튼
                        Button(action: {
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 15)
                    }
                    .textFieldStyle(RegisterTextStyle())
                    .padding(.bottom, 10)
                }
                
                // 로그인 버튼
                if checkLoginCondition() {
                    CustomButton(buttonText: "로그인", buttonTextColor: .white, buttonColor: .black, action: {
                        self.login()
                    })
                    .alert("로그인", isPresented: $isShowingLoginAlert) {
                        Button {
                            dismiss()
                        } label: {
                            Text("OK")
                        }
                    } message: {
                        Text(errorMessage.isEmpty ? "로그인에 성공했습니다." : errorMessage)
                    }
                } else {
                    CustomButton(buttonText: "로그인", buttonTextColor: .gray, buttonColor: .white, action: {})
                        .disabled(true)
                }
                
                // 화면을 채우는 공간
                Spacer()
                
                // "아직 계정이 없으신가요? 지금 회원가입하세요" 텍스트와 버튼
                HStack {
                    Text("아직 계정이 없으신가요? ")
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("지금 회원가입하세요")
                    }
                }
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .modifier(CustomNavigationBackButton())
        }
    }
    
    // 로그인 조건 검사
    func checkLoginCondition() -> Bool {
        return !email.isEmpty && !password.isEmpty && isEmailValid
    }
    
    // 로그인 처리
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
                isShowingLoginAlert = true
                return
            }
            // 로그인 성공
            errorMessage = ""
            isShowingLoginAlert = true
        }
    }
    
    // 이메일 유효성 검사
    func isCheckEmail() {
        if isValidEmail(email) {
            cautionEmail = ""
            isEmailValid = true
        } else if !isValidEmail(email) && email.count > 0 {
            cautionEmail = "올바르지 않은 이메일 형식입니다."
            isEmailValid = false
        }
    }
    
    // 이메일 형식 검사
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
