//
//  BuyLikeLionApp.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct BuyLikeLionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var keyboardHeight = KeyboardHeightHelper()
    @StateObject private var searchViewModel: SearchViewModel = SearchViewModel()
    @StateObject var registerViewModel: RegisterViewModel = RegisterViewModel()
    @StateObject var userAuth = UserAuth()

    var body: some Scene {
        WindowGroup {
          
            if userAuth.isLogged {
                MainTabView()
                    .environmentObject(userAuth)
                    .environmentObject(keyboardHeight)
                    .environmentObject(searchViewModel)
                    .environmentObject(registerViewModel)
            } else {
                WelcomeView()
                    .environmentObject(userAuth)
                    .environmentObject(registerViewModel)
            }
        }
    }
}

