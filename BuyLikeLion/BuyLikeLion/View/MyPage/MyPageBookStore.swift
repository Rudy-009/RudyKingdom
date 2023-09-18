//
//  MyPageBookStore.swift
//  BuyLikeLion
//
//  Created by 김윤우 on 2023/09/17.
//

import Foundation

class MyPageBookStore: ObservableObject {
    /// 판매완료
    @Published var completedPurchase: [MyPageBook] = [MyPageBook(name: "스윗한 SwiftUI", author: "이봉원", price: "28,800", bookImageURL: "https://shopping-phinf.pstatic.net/main_3245790/32457901670.20221227210312.jpg?type=w300"),
                                                      MyPageBook(name: "핵심만 골라 배우는 SwiftUI 기반의 iOS 프로그래밍", author: "제이펍 | 닐 스미스 저 / 황반석 역", price: "26,000원", bookImageURL: "https://image.yes24.com/goods/89421220/XL")]
    /// 구매완료
    @Published var completedSale: [MyPageBook] = []
    
    init() {
    
        completedSale = [
            MyPageBook(name: "핵심만 골라 배우는 SwiftUI 기반의 iOS 프로그래밍", author: "제이펍 | 닐 스미스 저 / 황반석 역", price: "26,000원", bookImageURL: "https://image.yes24.com/goods/89421220/XL")
        ]
    }
    
    func removePurchase(at offsets: IndexSet) {
            completedPurchase.remove(atOffsets: offsets)
        }
    
}
