//
//  SearchViewModel.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/15.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var searchResultPosts: [Post] = []
    @Published var recentSearchHistories: [String] = []
    
    init() {
        posts = [
            Post(writer: "김윤지", bookName: "핵심만 골라 배우는 SwiftUI 기반의 iOS 프로그래밍", bookAuthor: "닐 스미스 저 / 황반석 역", bookPublisher: "제이펍", price: 26000, content: "한번도 안 펼쳐본 책입니다.", images: [], writtenDate: "2023.03.01", isTrading: false),
            Post(writer: "김윤지", bookName: "C언어로 쉽게 풀어쓴 자료구조", bookAuthor: "천인국,공용해,하상호", bookPublisher: "생능출판", price: 15000, content: "한번도 안 펼쳐본 책입니다.", images: [], writtenDate: "2023.01.01", isTrading: false),
            Post(writer: "김윤지", bookName: "좋은 코드, 나쁜 코드", bookAuthor: "톰 롱", bookPublisher: "제이펍", price: 20000, content: "한번도 안 펼쳐본 책입니다.", images: [], writtenDate: "2023.02.01", isTrading: false),
        ]
    }
    
    func searchPost(_ searchText: String) {
        searchResultPosts = posts.filter {
            return $0.bookName.contains(searchText) ||
                    $0.bookAuthor.contains(searchText) ||
                    $0.bookPublisher.contains(searchText)
        }
    }
    
    func addRecentSearchHistory(_ searchText: String) {
        if recentSearchHistories.contains(searchText) {
            removeRecentSearchHistory(searchText)
        }
        recentSearchHistories.insert(searchText, at: 0)
    }
    
    func removeRecentSearchHistory(_ historyText: String) {
        for index in 0..<recentSearchHistories.count {
            if recentSearchHistories[index] == historyText {
                recentSearchHistories.remove(at: index)
                break
            }
        }
    }
    
    func removeAllRecentSearchHistories() {
        recentSearchHistories.removeAll()
    }
}
