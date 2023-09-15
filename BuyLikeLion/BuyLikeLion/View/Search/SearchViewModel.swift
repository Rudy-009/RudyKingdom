//
//  SearchViewModel.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/15.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var searchResultPosts: [Post] = []
    @Published var recentSearchWords: [String] = []
    
    init() {
        posts = [
            Post(writer: "김윤지", bookName: "C언어로 쉽게 풀어쓴 자료구조", bookAuthor: "천인국,공용해,하상호", bookPublisher: "생능출판", price: 15000, content: "한번도 안 펼쳐본 책입니다.", images: [], writtenDate: "2023.01.01", isTrading: false),
            Post(writer: "김윤지", bookName: "좋은 코드, 나쁜 코드", bookAuthor: "톰 롱", bookPublisher: "제이펍", price: 20000, content: "한번도 안 펼쳐본 책입니다.", images: [], writtenDate: "2023.01.01", isTrading: false),
        ]
    }
    
    func searchPost(_ searchText: String) {
        searchResultPosts = posts.filter {
            recentSearchWords.insert(searchText, at: 0)
            
            return $0.bookName.contains(searchText) ||
                    $0.bookAuthor.contains(searchText) ||
                    $0.bookPublisher.contains(searchText)
        }
    }
}
