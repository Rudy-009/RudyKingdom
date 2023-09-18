//
//  RegisterViewModel.swift
//  BuyLikeLion
//
//  Created by Suji Jang on 2023/09/16.
//

import Foundation
import Firebase
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var signUpStatus: Int? = nil  // 1: 성공, -1: 실패
    @Published var isEmailAvailable: Bool = true  // 이메일 중복 확인

    private let db = Firestore.firestore()
    
    func emailAuthSignUp(email: String, userName: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.signUpStatus = -1
                return
            }
            
            if let user = result?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = userName
                changeRequest.commitChanges { error in
                    if let error = error {
                        self.signUpStatus = -1
                        return
                    }
                }
                
                // 유저 정보를 Firestore에 저장
                self.db.collection("users").document(user.uid).setData([
                    "userName": userName,
                    "email": email
                ]) { error in
                    if let error = error {
                        self.signUpStatus = -1
                        return
                    }
                    self.signUpStatus = 1
                }
            }
        }
    }
    
    // 이메일 중복 확인
    func checkEmailAvailability(email: String) {
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { querySnapshot, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }
            
            self.isEmailAvailable = querySnapshot?.documents.isEmpty ?? true
        }
    }
}
