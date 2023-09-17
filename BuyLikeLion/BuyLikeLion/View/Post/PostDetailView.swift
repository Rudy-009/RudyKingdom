//
//  PostDetailView.swift
//  BuyLikeLion
//
//  Created by SONYOONHO on 2023/09/15.
//

import SwiftUI

struct PostDetailView: View {
    @StateObject var postViewModel: PostViewModel = PostViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            let safeArea = proxy.safeAreaInsets
            let size = proxy.size
            PostDetailContentView(safeArea: safeArea, size: size, postViewModel: postViewModel)
                .ignoresSafeArea(.container, edges: .top)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PostDetailView()
        }
    }
}
