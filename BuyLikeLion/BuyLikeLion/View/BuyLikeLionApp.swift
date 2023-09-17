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
    var body: some Scene {
        WindowGroup {
            ChattingView()
                .environmentObject(keyboardHeight)
        }
    }
}
