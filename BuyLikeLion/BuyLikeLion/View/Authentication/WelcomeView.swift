//
//  WelcomeView.swift
//  BuyLikeLion
//
//  Created by 박찬호 on 2023/09/16.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // 배경 이미지 설정
                Image("WelcomeBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // 반투명한 검은색 배경
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color.black.opacity(0.5))
                
                
                VStack {
                    
                    Spacer(minLength: 430)
                    
                    // 로고 이미지
                    AsyncImage(url: URL(string: "https://cdn.discordapp.com/attachments/1120264031366807583/1152271614394773536/ByLikeLion.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 130)
                                .cornerRadius(15)
                        } else {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 160, height: 130)
                        }
                    }
                    
                    // 웰컴 텍스트
                    Text("멋사책사")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 20)
                    
                    // 로그인 버튼
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        WelcomeButton(title: "로그인", textColor: Color.white, bgColor: Color.black)
                    }
                    
                    // 회원가입 버튼
                    NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true)) {
                        WelcomeButton(title: "회원가입", textColor: Color(red: 0.12, green: 0.14, blue: 0.17), bgColor: Color.white)
                    }
                    
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// 버튼 컴포넌트
struct WelcomeButton: View {
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(textColor)
            .frame(width: 331, height: 56)
            .background(bgColor)
            .cornerRadius(8)
            .padding(.bottom, 10)
    }
}

// 프리뷰 설정
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}




