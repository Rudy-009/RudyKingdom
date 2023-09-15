//
//  ContentView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack {
                MainPostView()
//                PostEditView()
            }
            .onTapGesture {
                self.selectedIndex = 0
            }
            .tabItem {
                Label("홈", systemImage: "house")
            }.tag(0)
            
            NavigationStack {
                ChattingListView()
            }
            .onTapGesture {
                self.selectedIndex = 1
            }
            .tabItem {
                Label("채팅", systemImage: "bubble.right")
            }.tag(1)
            
            NavigationStack {
                MyPageView()
            }
            .onTapGesture {
                self.selectedIndex = 2
            }
            .tabItem {
                Label("내 프로필", systemImage: "person")
            }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
