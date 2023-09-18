//
//  MyPageBookModel.swift
//  BuyLikeLion
//
//  Created by 김윤우 on 2023/09/17.
//

import Foundation

struct MyPageBook: Identifiable {
    var id: UUID = UUID()
    var name: String
    var author: String
    var price: String
    var bookImageURL: String
}
