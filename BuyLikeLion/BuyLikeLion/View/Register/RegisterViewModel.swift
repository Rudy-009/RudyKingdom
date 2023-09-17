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

//    func emailAuthSignUp(email: String, userName: String, password: String) -> Int? {
//
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print("error: \(error.localizedDescription)")
//
//                return
//            }
//
//            if result != nil {
//                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                changeRequest?.displayName = userName
//                print("사용자 이메일: \(String(describing: result?.user.email))")
//            }
//        }
//    }
    func emailAuthSignUp(email: String, userName: String, password: String) -> Int? {
        
        var returnValue: Int? = nil

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                returnValue = -1
            }
            
            if result != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                print("사용자 이메일: \(String(describing: result?.user.email))")
            }
        }
        
        return returnValue
    }
}
