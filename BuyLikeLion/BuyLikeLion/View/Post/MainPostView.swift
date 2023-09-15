//
//  MainPostView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI

struct MainPostView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(0...5, id: \.self) { index in
                    NavigationLink {
                        // TODO: PostDetailView로 이동
                    } label: {
                        PostCell()
                            .foregroundColor(.black)
                    }
                    
                    // TODO: index가 배열 크기랑 같지 않을 때로 바꿀 것
                    /// 맨 마지막 PostCell() 아래에는 Divider()를 넣지 않기 위함
                    if index != 5 {
                        Divider()
                            .frame(width: UIScreen.main.bounds.size.width * 0.9)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .refreshable {
            // TODO: 데이터 패치
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // TODO: 앱 로고로 교체
                Text("책사멋사")
                    .font(.title)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct MainPostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainPostView()
        }
    }
}
