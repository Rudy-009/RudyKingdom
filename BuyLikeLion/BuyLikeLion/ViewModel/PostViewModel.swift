//
//  PostViewMdoel.swift
//  BuyLikeLion
//
//  Created by SONYOONHO on 2023/09/15.
//

import Foundation

final class PostViewModel: ObservableObject {
    @Published var post: Post = Post.sampleData
    
}
